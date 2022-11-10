import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    String? mobileNumber,
  }) async {
    emit(const WebMailLoginState.loading());
    try {
      await _userRepository.logInToWebMail(
        rollNumber: rollNumber,
        password: password,
      );

      await _userRepository.getOrCreateUser(
        rollNumber: rollNumber,
        mobileNumber: mobileNumber ?? _userRepository.user!.mobile!,
      );

      await _userRepository.saveWebMailDetails(
        rollNumber: rollNumber,
        password: password,
      );
      emit(const WebMailLoginState.success());
    } catch (e) {
      emit(WebMailLoginState.error(e.toString()));
    }
  }
}
