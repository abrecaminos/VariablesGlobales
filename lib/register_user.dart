import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/home_page.dart';
import 'package:instagram_clone/sign_in_page.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/images.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _biodController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  File? imageProfile;
  bool isLoading = false;
  //Uint8List? imageProfileTwo;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _biodController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  Future pickImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        imageProfile = File(image.path);
      });
    } else {
      print('No image');
    }
  }

  Future<void> signUpUser() async {
    setState(() {
      isLoading = true;
    });

    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _userNameController.text,
      bio: _biodController.text,
      file: imageProfile!,
    );

    if (res != 'User created sucesfully') {
      showSnackBar(res, context);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: imageProfile != null
                        ? Image.file(imageProfile!)
                        : Image.network(kBenAfflekcSmoking),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {
                        pickImage();
                      },
                      icon: Icon(Icons.add_a_photo),
                      color: Colors.green,
                    ),
                  ),
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
              TextButton(
                  onPressed: signUpUser,
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: kPrimaryColor,
                        )
                      : Text('Register')),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInPage()),
                    );
                  },
                  child: Text('If you have an account sign in')),
              Text('Remember your password'),
            ],
          ),
        ),
      ),
    ));
  }
}
