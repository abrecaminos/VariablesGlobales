// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:instagram_clone/home_page.dart';
import 'package:instagram_clone/register_user.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  void signIn() async {
    isLoading = true;

    String res = await AuthMethods()
        .logInUser(_emailController.text, _passwordController.text);

    isLoading = false;

    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Logo', style: TextStyle(fontSize: 40)),
            TextFieldInput(
              textEditingController: _emailController,
              hintText: 'Email',
              TextInputType: TextInputType.emailAddress,
            ),
            TextFieldInput(
              textEditingController: _passwordController,
              hintText: 'Password',
              TextInputType: TextInputType.text,
              obscureText: true,
            ),
            TextButton(
                onPressed: () {},
                child: isLoading
                    ? CircularProgressIndicator(color: kPrimaryColor)
                    : Text('Sign In')),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()),
                  );
                },
                child: Text('Register if you dont have an account')),
            Text('Remember your password'),
          ],
        ),
      ),
    ));
  }
}
