import 'package:elaichi/presentation/components/buttons/back_button.dart';
import 'package:elaichi/presentation/components/buttons/yellow_buttons.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/home/fest/bloc/fest_bloc.dart';
import 'package:elaichi/presentation/mail/webmail_login_bottom_sheet/webmai_login_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: constant_identifier_names
enum NitrStudent { Yes, No }

class StudentConfirmationPage extends StatefulWidget {
  const StudentConfirmationPage({Key? key}) : super(key: key);

  @override
  State<StudentConfirmationPage> createState() =>
      _StudentConfirmationPageState();
}

class _StudentConfirmationPageState extends State<StudentConfirmationPage> {
  NitrStudent? groupValue = NitrStudent.Yes;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: RegisterBottomBar(
          child: YellowFlatButton(
            text: 'Next',
            onTapped: () {
              if (groupValue == NitrStudent.Yes) {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => const WebMailLoginBottomSheet(),
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
    );
  }
}

class RegisterBottomBar extends StatelessWidget {
  const RegisterBottomBar({
    Key? key,
    required this.child,
  }) : super(key: key);

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
