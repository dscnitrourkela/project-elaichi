import 'package:elaichi/data/constants/global_enums.dart';
import 'package:elaichi/presentation/components/buttons/back_button.dart';
import 'package:elaichi/presentation/components/buttons/yellow_buttons.dart';
import 'package:elaichi/presentation/components/toasts/toast_util.dart';
import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/home/fest/bloc/fest_bloc.dart';
import 'package:elaichi/presentation/mail/webmail_login_bottom_sheet/webmai_login_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: constant_identifier_names
enum NitrStudent { Yes, No }

class StudentConfirmationPage extends StatefulWidget {
  const StudentConfirmationPage({super.key});

  @override
  State<StudentConfirmationPage> createState() =>
      _StudentConfirmationPageState();
}

class _StudentConfirmationPageState extends State<StudentConfirmationPage> {
  NitrStudent? groupValue = NitrStudent.Yes;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FestBloc>();
    final toastUtil = ToastUtil.getInstance();
    return BlocProvider.value(
      value: bloc,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: RegisterBottomBar(
            child: YellowFlatButton(
              text: 'Next',
              onTapped: () {
                if (groupValue == NitrStudent.Yes) {
                  Navigator.pushNamed(context, AppRouter.registrationForm);
                } else {
                  toastUtil.showToast(
                    mode: ToastMode.Error,
                    title: 'Uh Oh! Registrations closed!',
                  );
                }
              },
            ),
          ),
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBackButton(),
                const SizedBox(height: 16),
                Text(
                  'Fest Registration',
                  style: interTextTheme.headline2,
                ),
                const SizedBox(height: 22),
                Text(
                  'Are you a student of NIT Rourkela?',
                  style: interTextTheme.bodyText1!.copyWith(
                    fontSize: 16,
                    height: 1.21,
                  ),
                ),
                Text(
                  '(Pssst... NITR students don’t pay any registration fees)',
                  style: interTextTheme.bodyText1!.copyWith(
                    fontSize: 14,
                    height: 1.42,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Radio(
                      activeColor: AppColors.yellowButton,
                      value: NitrStudent.Yes,
                      groupValue: groupValue,
                      onChanged: (NitrStudent? value) {
                        setState(() {
                          groupValue = value;
                        });
                      },
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Yes',
                      style: interTextTheme.bodyText1!
                          .copyWith(fontSize: 16, height: 1.7),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Radio(
                      value: NitrStudent.No,
                      groupValue: groupValue,
                      activeColor: AppColors.yellow,
                      onChanged: (NitrStudent? value) {
                        setState(() {
                          groupValue = value;
                        });
                      },
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'No',
                      style: interTextTheme.bodyText1!
                          .copyWith(fontSize: 16, height: 1.7),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegistrationDetails extends StatefulWidget {
  const RegistrationDetails({super.key});

  @override
  State<RegistrationDetails> createState() => _RegistrationDetailsState();
}

class _RegistrationDetailsState extends State<RegistrationDetails> {
  late final TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<FestBloc, FestState>(
        listener: (context, state) {
          state.whenOrNull(
            initial: (webMailState, fests) {
              if (webMailState == WebMailState.authenticated) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRouter.home,
                  (route) => false,
                );
              }
            },
          );
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          bottomNavigationBar: RegisterBottomBar(
            child: YellowFlatButton(
              text: 'Verify',
              onTapped: () {
                if (_formKey.currentState!.validate()) {
                  showModalBottomSheet<void>(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) =>
                        WebMailLoginBottomSheet(mobileNumber: _controller.text),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                  ).then(
                    (value) => context
                        .read<FestBloc>()
                        .add(const FestEvent.webMailLogIn()),
                  );
                }
              },
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBackButton(),
                  const SizedBox(height: 16),
                  Text(
                    'Fest Registration',
                    style: interTextTheme.headline2,
                  ),
                  const SizedBox(height: 24),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      style: interTextTheme.bodyText1,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.zero,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.zero,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.zero,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.zero,
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.zero,
                        ),
                        fillColor: AppColors.grey15,
                        hintText: 'Mobile Number',
                        hintStyle: interTextTheme.bodyText2!
                            .copyWith(color: AppColors.grey15),
                      ),
                      controller: _controller,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.characters.length != 10) {
                          return 'Please enter a valid mobile number';
                        } else {
                          return null;
                        }
                      },
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class RegisterBottomBar extends StatelessWidget {
  const RegisterBottomBar({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ColoredBox(
        color: AppColors.translucentButton,
        child: Column(
          children: [
            const Divider(height: 1, thickness: 1, color: AppColors.grey7),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 13, 16, 20),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
