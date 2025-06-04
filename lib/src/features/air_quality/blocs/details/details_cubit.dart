import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/exceptions/pure_air_exception.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit({
    required AirQualityRepository repository,
    required List<double> geo,
  })  : _repository = repository,
        _geo = geo,
        super(const DetailsLoadInProgress());

  final AirQualityRepository _repository;
  final List<double> _geo;

  Future<void> initialize() async {
    emit(const DetailsLoadInProgress());
    final response = await _repository.getByGeo(_geo);
    return emit(response.fold(DetailsLoadFailure.new, DetailsLoadSuccess.new));
  }
}
