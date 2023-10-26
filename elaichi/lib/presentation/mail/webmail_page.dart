import 'dart:async';

import 'package:elaichi/data/constants/app_env.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:elaichi/presentation/components/buttons/blue_button.dart';
import 'package:elaichi/presentation/components/toasts/toast_util.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/mail/cubit/webmail_cubit.dart';
import 'package:elaichi/presentation/mail/webmail_login_bottom_sheet/webmai_login_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

///The Mail Page
class WebMailPage extends StatefulWidget {
  /// Default constructor
  const WebMailPage({super.key});

  @override
  State<WebMailPage> createState() => _WebMailPageState();
}

class _WebMailPageState extends State<WebMailPage> {
  late final WebmailCubit _cubit;

  final _toastUtil = ToastUtil.getInstance();

  final controller = Completer<WebViewController>();

  @override
  void initState() {
    _cubit = WebmailCubit(userRepository: context.read<UserRepository>());
    WebView.platform = AndroidWebView();
    _cubit.getZsAuthToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => _cubit,
          child: BlocConsumer<WebmailCubit, WebmailState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                error: (error) =>
                    _toastUtil.showToast(mode: ToastMode.Error, title: error),
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => Center(
                  child: Text(
                    'Something Went Wrong',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                authenticated: () => WebViewStack(controller: controller),
                unauthenticated: () => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Please click the below button to login to your account',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 10),
                        BlueButton(
                          text: 'Login',
                          onTapped: () {
                            showModalBottomSheet<dynamic>(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) =>
                                  const WebMailLoginBottomSheet(),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                              ),
                            ).then((dynamic value) => _cubit.getZsAuthToken());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class WebViewStack extends StatefulWidget {
  const WebViewStack({
    super.key,
    required this.controller,
  });

  final Completer<WebViewController> controller;

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  int loadingPercentage = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WillPopScope(
          onWillPop: () async {
            final controller = await widget.controller.future;
            if (await controller.canGoBack()) {
              await controller.goBack();
              return false;
            }
            return true;
          },
          child: WebView(
            onWebViewCreated: (controller) =>
                widget.controller.complete(controller),
            onProgress: (progress) => setState(() {
              loadingPercentage = progress;
            }),
            onPageStarted: (url) => setState(() {
              loadingPercentage = 0;
            }),
            onPageFinished: (url) => setState(() {
              loadingPercentage = 100;
            }),
            initialUrl: Env.avenueWebMailBaseUrl +
                context.read<WebmailCubit>().zsAuthToken!,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            color: AppColors.lightBlue,
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }
}
