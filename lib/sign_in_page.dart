import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/images.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _biodController = TextEditingController();
    final TextEditingController _userNameController = TextEditingController();

    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Logo', style: TextStyle(fontSize: 40)),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: kBenAfflekcSmoking,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_a_photo),
                      color: Colors.green,
                    ),
                  )
                ],
              ),
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
              TextFieldInput(
                textEditingController: _biodController,
                hintText: 'Biography',
                TextInputType: TextInputType.text,
              ),
              TextFieldInput(
                textEditingController: _userNameController,
                hintText: 'User Name',
                TextInputType: TextInputType.text,
              ),
              TextButton(onPressed: () {}, child: Text('Sign In')),
              TextButton(
                  onPressed: () {},
                  child: Text('Sign up if you dont have an account')),
              Text('Remember your password'),
            ],
          ),
        ),
      ),
    ));
  }
}
