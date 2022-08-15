import 'package:elaichi/data/constants/app_env.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:elaichi/presentation/components/buttons/custom_button.dart';
import 'package:elaichi/presentation/components/toasts/toast_util.dart';
import 'package:elaichi/presentation/mail/cubit/webmail_cubit.dart';
import 'package:elaichi/presentation/mail/webmail_login_bottom_sheet/webmai_login_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

///The Mail Page
class WebMailPage extends StatefulWidget {
  /// Default constructor
  const WebMailPage({Key? key}) : super(key: key);

  @override
  State<WebMailPage> createState() => _WebMailPageState();
}

class _WebMailPageState extends State<WebMailPage> {
  late final WebmailCubit _cubit;

  final _toastUtil = ToastUtil.getInstance();

  @override
  void initState() {
    _cubit = WebmailCubit(userRepository: context.read<UserRepository>());
    WebView.platform = AndroidWebView();
    _cubit.getZsAuthToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              authenticated: () => WebView(
                initialUrl: Env.avenueWebMailBaseUrl + _cubit.zsAuthToken!,
                javascriptMode: JavascriptMode.unrestricted,
              ),
              unauthenticated: () => Center(
                child: Column(
                  children: [
                    Text(
                      'Please click the below button to login to your account',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    CustomButton(
                      text: 'Login',
                      onTapped: () {
                        showModalBottomSheet<dynamic>(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => const WebMailLoginBottomSheet(),
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
            );
          },
        ),
      ),
    );
  }
}
