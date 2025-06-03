import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/exceptions/pure_air_exception.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';

part 'localized_event.dart';
part 'localized_state.dart';

class LocalizedBloc extends Bloc<LocalizedEvent, LocalizedState> {
  LocalizedBloc({
    required AirQualityRepository repository,
  })  : _repository = repository,
        super(const LocalizedInitial()) {
    on<LocalizedStarted>(_onLocalizedStarted);
  }
  final AirQualityRepository _repository;

  Future<void> _onLocalizedStarted(
    LocalizedStarted event,
    Emitter<LocalizedState> emit,
  ) async {
    emit(const LocalizedLoadInProgress());
    final failureOrSuccess = await _repository.getLocalized();
    emit(
      failureOrSuccess.fold(
        LocalizedLoadFailure.new,
        LocalizedLoadSuccess.new,
      ),
    );
  }
}
