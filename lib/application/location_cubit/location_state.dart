part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState({
    String? city,
    String? state,
    String? country,
    required List<double> geo,
    required bool loading,
  }) = _LocationState;

  factory LocationState.initial() {
    return const LocationState(
      city: null,
      state: null,
      country: null,
      geo: [],
      loading: false,
    );
  }
}
