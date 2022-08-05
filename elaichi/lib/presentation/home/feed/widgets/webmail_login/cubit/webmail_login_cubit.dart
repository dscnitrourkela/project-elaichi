import 'package:bloc/bloc.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'webmail_login_state.dart';
part 'webmail_login_cubit.freezed.dart';

class WebMailLoginCubit extends Cubit<WebMailLoginState> {
  WebMailLoginCubit({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const WebMailLoginState.initial());

  final UserRepository _userRepository;

  Future<void> logInToWebMail({
    required String rollNumber,
    required String password,
  }) async {
    emit(const WebMailLoginState.loading());
    try {
      await _userRepository.saveWebMailDetails(
        rollNumber: rollNumber,
        password: password,
      );
      await _userRepository.logInToWebMail();
      emit(const WebMailLoginState.success());
    } catch (e) {
      emit(WebMailLoginState.error(e.toString()));
    }
  }
}
