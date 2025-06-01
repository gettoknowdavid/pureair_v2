import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/exceptions/pure_air_exception.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit({
    required AirQualityRepository repository,
  })  : _repository = repository,
        super(const DetailsLoadInProgress());

  final AirQualityRepository _repository;

  Future<void> initialize({AirQuality? airQuality, List<double>? geo}) async {
    if (airQuality == null && geo == null) {
      return emit(
        const DetailsLoadFailure(
          PureAirQualityUnavailable(),
        ),
      );
    }

    emit(const DetailsLoadInProgress());

    if (airQuality != null && geo == null) {
      return emit(DetailsLoadSuccess(airQuality));
    }

    if (airQuality == null && geo != null) {
      final failureOrSuccess = await _repository.getByGeo(geo);
      return emit(
        failureOrSuccess.fold(
          DetailsLoadFailure.new,
          DetailsLoadSuccess.new,
        ),
      );
    }
  }
}
