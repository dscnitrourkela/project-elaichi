import 'package:elaichi/app/utils/sizeconfig.dart';
import 'package:elaichi/app/utils/strings.dart';
import 'package:elaichi/feed/application/feed_cubit.dart';
import 'package:elaichi/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Modal Sheet for Webmail Login
class ModalSheet extends StatefulWidget {
  /// Default Constructore
  const ModalSheet({Key? key}) : super(key: key);

  @override
  ModalSheetState createState() => ModalSheetState();
}

/// State Manager of the Modal Sheet
class ModalSheetState extends State<ModalSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedCubit, FeedState>(
      builder: (ctx, state) {
        return SizedBox(
          height: SizeConfig.screenHeight! * 0.4,
          child: Column(
            children: [
              customAppBar(
                text: Strings.webmailLogin,
                context: context,
              ),
              Form(
                key: ctx.read<FeedCubit>().formkey,
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 5),
                  child: Column(
                    children: [
                      TextBoxRollNo(
                        textEditingController:
                            ctx.read<FeedCubit>().rollNoController,
                      ),
                      TextBoxPassword(
                        textEditingController:
                            ctx.read<FeedCubit>().passwordController,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.safeBlockHorizontal! * 2,
                        ),
                        child: TextButton(
                          onPressed: () {
                            GoRouter.of(context).pop(context);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0XFF2F80ED),
                            ),
                            minimumSize: MaterialStateProperty.all(
                              Size(
                                SizeConfig.screenWidth! * 0.85,
                                SizeConfig.safeBlockHorizontal! * 10,
                              ),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          child: Text(
                            Strings.login,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Theme.of(context).canvasColor,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

/// Form Text Box for the roll number
class TextBoxRollNo extends StatelessWidget {
  /// Default Constructore for [TextBoxRollNo]
  const TextBoxRollNo({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  /// Text Editing Controller for Roll Number field
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal!,
            vertical: SizeConfig.safeBlockHorizontal!,
          ),
          child: Text(
            Strings.rollNo,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Theme.of(context).hintColor,
                ),
          ),
        ),
        TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          textCapitalization: TextCapitalization.words,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}

/// Form text box for the password
class TextBoxPassword extends StatelessWidget {
  /// Default Constructor
  const TextBoxPassword({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  ///text Editing Controller for the Password Field
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal!,
            vertical: SizeConfig.safeBlockHorizontal!,
          ),
          child: Text(
            Strings.password,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Theme.of(context).hintColor,
                ),
          ),
        ),
        TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          keyboardType: TextInputType.visiblePassword,
          textCapitalization: TextCapitalization.words,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
