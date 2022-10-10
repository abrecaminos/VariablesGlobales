import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

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
            TextButton(onPressed: () {}, child: Text('Sign In')),
            TextButton(
                onPressed: () {},
                child: Text('Sign up if you dont have an account')),
            Text('Remember your password'),
          ],
        ),
      ),
    ));
  }
}
