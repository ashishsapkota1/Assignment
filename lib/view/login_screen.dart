import 'package:flutter/material.dart';
import 'package:untitled1/utils/utils.dart';

import '../utils/routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: responsive.screenHeight * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: const DecorationImage(
                      image: AssetImage(Images.loginScreenImage),
                      fit: BoxFit.fill),
                ),
              ),
              verticalSpacing(space: 10),
              const Image(
                image: AssetImage(Images.nikkleLogo),
                height: 130,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Let\'s get something',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                    ),
                    const Text(
                      'Good to see you back',
                      style: TextStyle(color: AppColor.textColor),
                    ),
                    verticalSpacing(space: 10),
                    const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          label: Text(
                            'Email',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    verticalSpacing(space: 10),
                    const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: TextField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          label: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Password',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                              Text(
                                'Forgot?',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacing(space: 24),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.homeScreen);
                },
                child: Center(
                  child: Container(
                    height: responsive.screenHeight * 0.07,
                    width: responsive.screenWidth * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColor.containerColor),
                    child: const Center(
                      child: Text(
                        'Log In',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
             verticalSpacing(space: 14),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?', style: TextStyle(color: AppColor.textColor, fontSize: 16),),
                  horizontalSpacing(space: 8),
                  const Text('Sign Up', style: TextStyle(color: AppColor.containerColor, fontWeight: FontWeight.w500),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
