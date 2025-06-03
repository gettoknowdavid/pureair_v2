part of 'localized_bloc.dart';

sealed class LocalizedEvent with EquatableMixin {
  const LocalizedEvent();

  @override
  List<Object?> get props => [];
}

final class LocalizedStarted extends LocalizedEvent {
  const LocalizedStarted();
}