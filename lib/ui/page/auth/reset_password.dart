import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:louzero/common/app_button.dart';
import 'package:louzero/common/app_card_center.dart';
import 'package:louzero/common/app_input_text.dart';
import 'package:louzero/common/app_text_body.dart';
import 'package:louzero/common/app_text_header.dart';
import 'package:louzero/common/app_text_help_link.dart';
import 'package:louzero/controller/api/auth/auth.dart';
import 'package:louzero/controller/page_navigation/navigation_controller.dart';

import '../base_scaffold.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void initState() {
    if (kDebugMode) {
      _emailController.text = "mark.austen@singlemindconsulting.com";
    }
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const title = "Can't Login?";
    const body =
        "Not to worry. Enter the email address you use to sign in to LOUzero below and we'll send you instructions on how to set a new password. ";
    return BaseScaffold(
      child: AppCardCenter(
        child: Column(
          children: [
            const AppTextHeader(
              title,
            ),
            const AppTextBody(
              body,
              px: 24,
              mb: 32,
            ),
            AppInputText(
              controller: _emailController,
              label: "Your Email",
              keyboardType: TextInputType.emailAddress,
            ),
            AppButton(
              label: 'Email Reset Instructions',
              onPressed: _onResetPassword,
            ),
            const SizedBox(
              height: 14,
            ),
            AppTextHelpLink(
                label: 'Never mind, go back to ',
                linkText: 'Sign In',
                onPressed: _onSignIn),
          ],
        ),
      ),
    );
  }

  void _onResetPassword() async {
    NavigationController().notifierInitLoading.value = true;
    await AuthAPI().resetPassword(_emailController.text);
    NavigationController().notifierInitLoading.value = false;
    NavigationController().pop(context);
  }

  void _onSignIn() async {
    NavigationController().pop(context);
  }
}