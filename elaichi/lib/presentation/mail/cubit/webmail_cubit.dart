import 'package:bloc/bloc.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'webmail_state.dart';
part 'webmail_cubit.freezed.dart';

class WebmailCubit extends Cubit<WebmailState> {
  WebmailCubit({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const WebmailState.initial());

  final UserRepository _userRepository;

  String? zsAuthToken;

  Future<void> getZsAuthToken() async {
    emit(const WebmailState.loading());
    final token = _userRepository.zsToken;

    if (token != null) {
      zsAuthToken = token;
      emit(const WebmailState.authenticated());
    } else {
      await _userRepository.logInToWebMail();

      if (_userRepository.zsToken != null) {
        zsAuthToken = _userRepository.zsToken;
        emit(const WebmailState.authenticated());
      } else {
        emit(const WebmailState.unauthenticated());
      }
    }
  }
}
