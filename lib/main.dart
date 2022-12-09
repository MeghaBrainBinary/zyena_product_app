// ignore: depend_on_referenced_packages
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:product_app/app/common/sizedbox.dart';
import 'package:product_app/app/helpers/prefkeys.dart';
import 'package:product_app/app/helpers/prefs.dart';
import 'package:product_app/app/notification/notification_service.dart';
import 'package:product_app/app/screen/home_screen/home_screen.dart';
import 'package:product_app/app/screen/new_order_screen/new_order_screen.dart';
import 'package:product_app/app/screen/new_service_screen/new_service_screen.dart';
import 'package:product_app/app/screen/order_screen/order_screen.dart';
import 'package:product_app/app/screen/signin_screen/signin_screen.dart';
import 'package:product_app/app/screen/signup_screen/signup_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:product_app/app/screen/splash_screen/splash_screen.dart';
import 'package:product_app/app/screen/update_order_screen/update_order_screen.dart';
import 'package:product_app/app/utils/approutes.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:product_app/app/utils/appstyle.dart';
import 'package:product_app/app/utils/color_res.dart';
import 'package:product_app/game/models/audio_resume.dart';
import 'package:product_app/game/utilities/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsBinding.instance.addObserver(Handler());
  await Firebase.initializeApp();
  await PrefService.init();
  NotificationService.init();
  try {
    await FirebaseMessaging.instance.getToken().then((value) {
      PrefService.setValue(PrefKeys.userToken, value.toString());
      if (kDebugMode) {
        print("FCM Token => $value");
      }
    });
  } catch (e) {
    print(e);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme:
            ThemeData(primarySwatch: Colors.blue, textTheme: const TextTheme()),
        getPages: [
          GetPage(name: AppRoutes.signupPage, page: () => SignupScreen()),
          GetPage(name: AppRoutes.sigInPage, page: () => SignInScreen()),
          GetPage(name: AppRoutes.homePage, page: () => HomeScreen()),
          GetPage(name: AppRoutes.newOrderPage, page: () => NewOrderScreen()),
          GetPage(
              name: AppRoutes.updateOrderPage, page: () => UpdateOrderScreen()),
          GetPage(name: AppRoutes.orderListPage, page: () => OrderScreen()),
          GetPage(
              name: AppRoutes.newServicePage, page: () => NewServiceScreen()),
        ],
        home: HomeAppGameScreen()
        //  (PrefService.getBool(PrefKeys.isLogin))
        //     ? HomeScreen()
        //     : SignInScreen(),
        );
  }
}

class HomeAppGameScreen extends StatelessWidget {
  const HomeAppGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => SplashScreen());
              },
              child: Container(
                alignment: Alignment.center,
                // margin: const EdgeInsets.only(
                //     bottom: 25, top: 50, left: 50, right: 50),
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: ColorRes.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 5,
                      color: Colors.grey.shade200,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text("Game",
                    style: appTextStyle(color: ColorRes.skyBlue, fontSize: 40)),
              ),
            ),
            sizedBoxHeight(height: 0.08),
            GestureDetector(
              onTap: () {
                (PrefService.getBool(PrefKeys.isLogin))
                    ? Get.toNamed(AppRoutes.homePage)
                    : (PrefService.getBool(PrefKeys.isSplash))
                        ? Get.toNamed(AppRoutes.sigInPage)
                        : Get.to(() => SplashAppScreen());
                //     ? HomeScreen()
                //     : SignInScreen(),
              },
              child: Container(
                // margin: const EdgeInsets.only(
                //     top: 25, bottom: 50, left: 50, right: 50),
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  color: ColorRes.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 5,
                      color: Colors.grey.shade200,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,

                child: Text("App",
                    style: appTextStyle(color: ColorRes.skyBlue, fontSize: 40)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
