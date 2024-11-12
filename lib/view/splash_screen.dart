import 'package:flutter/material.dart';

import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: responsive.screenHeight * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage(Images.splashScreenImage),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    // Aligns the logo at the top center
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: responsive.screenHeight * 0.2),
                      // Adjusts the distance from the top
                      child: Container(
                        height: responsive.screenHeight * 0.2,
                        // Logo height
                        width: responsive.screenWidth * 0.4,
                        // Adjust width as needed
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Images.logo),
                            fit: BoxFit
                                .contain, // Ensures the logo retains its aspect ratio
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    top: 110,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                            color: AppColor.sphereColor,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 90,
                    top: -20,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 49,
                        width: 50,
                        decoration: BoxDecoration(
                            color: AppColor.sphereColor,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 200,
                    top: -20,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: AppColor.sphereColor,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 300,
                    top: 250,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: AppColor.sphereColor,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  )
                ],
              ),
              verticalSpacing(space: 8),
              const Text(
                'NIKKLE',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              const Text('Simplify everything with Nikkle: accounting, HR'),
              const Text('CRM, project management, and credit'),
              const Text('application!'),
              verticalSpacing(space: 20),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.loginScreen);
                },
                child: Container(
                  height: responsive.screenHeight* 0.06,
                  width: responsive.screenWidth * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.containerColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('LOGIN', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),),
                     horizontalSpacing(space: 8),
                     Container(
                       height: 25,
                       width: 25,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(30)
                       ),
                       child:  const Icon(Icons.login_outlined, color: AppColor.containerColor,size: 20,),
                     )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
