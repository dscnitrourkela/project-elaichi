part of 'registration_cubit.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState.initial({
    required List<EventRegistration> eventRegistrations,
  }) = _Initial;

  const factory RegistrationState.loading({required String eventID}) = _Loading;

  const factory RegistrationState.success() = _Success;

  const factory RegistrationState.error({required String error}) = _Error;
}
