// ignore: depend_on_referenced_packages
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:product_app/helpers/prefkeys.dart';
import 'package:product_app/helpers/prefs.dart';
import 'package:product_app/notification/notification_service.dart';
import 'package:product_app/screen/home_screen/home_screen.dart';
import 'package:product_app/screen/new_order_screen/new_order_screen.dart';
import 'package:product_app/screen/new_service_screen/new_service_screen.dart';
import 'package:product_app/screen/order_screen/order_screen.dart';
import 'package:product_app/screen/signin_screen/signin_screen.dart';
import 'package:product_app/screen/signup_screen/signup_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:product_app/utils/approutes.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PrefService.init();
  NotificationService.init();

  await FirebaseMessaging.instance.getToken().then((value) {
    PrefService.setValue(PrefKeys.userToken, value.toString());
    if (kDebugMode) {
      print("FCM Token => $value");
    }
  });
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
        GetPage(name: AppRoutes.orderListPage, page: () => OrderScreen()),
        GetPage(name: AppRoutes.newServicePage, page: () => NewServiceScreen()),
      ],
      home: (PrefService.getBool(PrefKeys.isLogin))
          ? HomeScreen()
          : SignInScreen(),
    );
  }
}
