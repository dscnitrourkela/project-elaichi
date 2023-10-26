import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:elaichi/presentation/components/bottom_sheet/bottom_sheet.dart';
import 'package:elaichi/presentation/components/buttons/blue_button.dart';
import 'package:elaichi/presentation/components/inputs/text_field_input.dart';
import 'package:elaichi/presentation/components/toasts/toast_util.dart';
import 'package:elaichi/presentation/home/cubit/home_cubit.dart';
import 'package:elaichi/presentation/mail/webmail_login_bottom_sheet/cubit/webmail_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WebMailLoginBottomSheet extends StatefulWidget {
  const WebMailLoginBottomSheet({super.key, this.mobileNumber});

  final String? mobileNumber;
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
  late final String currentRollNumber;

  @override
  void initState() {
    _cubit = WebMailLoginCubit(userRepository: context.read<UserRepository>());
    currentRollNumber = context.read<UserRepository>().rollNumber ?? '';
    _rollNumber = TextEditingController();
    _password = TextEditingController();
    _rollNumber.text = currentRollNumber;
    super.initState();
  }

  String? get _errorText {
    final text = _rollNumber.value.text;
    if (text != currentRollNumber) {
      return 'Different roll number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WebMailLoginCubit>(
      create: (context) => _cubit,
      child: BlocConsumer<WebMailLoginCubit, WebMailLoginState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            error: (error) {
              if(error.contains("Unique constraint failed on the constraint: `User_mobile_key`") && error.contains("Invalid `prisma.user.create()`")) {
                _toastUtil.showToast(
                  mode: ToastMode.Error,
                  title: "Mobile number already registered, try another",
                );
              } else {
                _toastUtil.showToast(
                  mode: ToastMode.Error,
                  title: error,
                );
              }
              Navigator.pop(context);
            },
            success: () {
              context.read<HomeCubit>().checkIfVerified();
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
                      errorText: _errorText,
                      // onChanged: (_) => setState(() {}),
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
                  trailingIcon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  text: 'Login',
                  onTapped: () async {
                    FocusScope.of(context).unfocus();
                    if(currentRollNumber.isNotEmpty){
                      if(_errorText == null){
                        await _cubit.logInToWebMail(
                          rollNumber: _rollNumber.text,
                          password: _password.text,
                          mobileNumber: widget.mobileNumber,
                        );
                      }
                    } else {
                      await _cubit.logInToWebMail(
                        rollNumber: _rollNumber.text,
                        password: _password.text,
                        mobileNumber: widget.mobileNumber,
                      );
                    }
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
