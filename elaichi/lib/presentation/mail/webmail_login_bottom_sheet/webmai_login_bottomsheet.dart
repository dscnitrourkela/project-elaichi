import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:elaichi/presentation/components/bottom_sheet/bottom_sheet.dart';
import 'package:elaichi/presentation/components/buttons/blue_button.dart';
import 'package:elaichi/presentation/components/inputs/text_field_input.dart';
import 'package:elaichi/presentation/components/toasts/toast_util.dart';
import 'package:elaichi/presentation/mail/webmail_login_bottom_sheet/cubit/webmail_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WebMailLoginBottomSheet extends StatefulWidget {
  const WebMailLoginBottomSheet({Key? key}) : super(key: key);

  @override
  State<WebMailLoginBottomSheet> createState() =>
      _WebMailLoginBottomSheetState();
}

class _WebMailLoginBottomSheetState extends State<WebMailLoginBottomSheet> {
  late final WebMailLoginCubit _cubit;
  late final TextEditingController _rollNumber;
  late final TextEditingController _password;
  bool obscureText = true;
  final _toastUtil = ToastUtil.getInstance();

  @override
  void initState() {
    _cubit = WebMailLoginCubit(userRepository: context.read<UserRepository>());
    _rollNumber = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WebMailLoginCubit>(
      create: (context) => _cubit,
      child: BlocConsumer<WebMailLoginCubit, WebMailLoginState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            error: (error) => _toastUtil.showToast(
              mode: ToastMode.Error,
              title: error,
            ),
            success: () {
              _toastUtil.showToast(
                mode: ToastMode.Success,
                title: 'Logged In Successfully',
              );
              Navigator.pop(context);
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            orElse: () => Container(),
            initial: () => CustomBottomSheet(
              title: 'Webmail Login',
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFieldInput(
                      title: 'Roll Number',
                      hintText: 'Roll Number',
                      controller: _rollNumber,
                      maxLength: 9,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFieldInput(
                      title: 'Password',
                      hintText: 'Password',
                      obscureText: obscureText,
                      controller: _password,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(
                          obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              footer: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: BlueButton(
                  text: 'Login',
                  onTapped: () async {
                    FocusScope.of(context).unfocus();
                    await _cubit.logInToWebMail(
                      rollNumber: _rollNumber.text,
                      password: _password.text,
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
