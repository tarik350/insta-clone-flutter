import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:instagram_flutter/utils/colors.dart';
import '../widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(children: [
          //for some spacing
          Flexible(
            child: Container(),
            flex: 1,
          ),

          //logo
          SvgPicture.asset(
            'assets/images/ic_instagram.svg',
            color: primaryColor,
          ),
          SizedBox(
            height: 64,
          ),
          //profile picture
          Stack(
            children: [
              const CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1665686377065-08ba896d16fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80'),
              ),
              Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.add_a_photo)))
            ],
          ),
          SizedBox(
            height: 24,
          ),

          //username field
          TextFieldInput(
              textEditingController: _usernameController,
              hintText: 'Enter your username',
              textInputType: TextInputType.text),
          SizedBox(
            height: 24,
          ),
          //email text field
          TextFieldInput(
              textEditingController: _emailController,
              hintText: 'Enter your email',
              textInputType: TextInputType.emailAddress),
          const SizedBox(
            height: 24,
          ),
          //passowrd field
          TextFieldInput(
              isPassword: true,
              textEditingController: _passwordController,
              hintText: 'Enter your password',
              textInputType: TextInputType.visiblePassword),
          SizedBox(
            height: 24,
          ),
          //bio field
          TextFieldInput(
              textEditingController: _bioController,
              hintText: 'Enter your bio',
              textInputType: TextInputType.text),

          const SizedBox(
            height: 24,
          ),
          //login button
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(
                  color: blueColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)))),
              child: const Text(
                'sginup',
                style: TextStyle(),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Flexible(
            child: Container(),
            flex: 2,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: const Text('don\'t have an accunt?')),
              GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'signup',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          )
        ]),
      )),
    );
  }
}
