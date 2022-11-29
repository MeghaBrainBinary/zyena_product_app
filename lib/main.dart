// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:product_app/screen/home_screen/home_screen.dart';
import 'package:product_app/screen/new_order_screen/new_order_screen.dart';
import 'package:product_app/screen/new_service_screen/new_service_screen.dart';
import 'package:product_app/screen/order_screen/order_screen.dart';
import 'package:product_app/screen/signin_screen/signin_screen.dart';
import 'package:product_app/screen/signup_screen/signup_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:product_app/screen/splash_screen/splash_screen.dart';
import 'package:product_app/utils/approutes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialRoute: "/",
      getPages: [
        GetPage(name: AppRoutes.signupPage, page: () => SignupScreen()),
        GetPage(name: AppRoutes.sigInPage, page: () => SignInScreen()),
        GetPage(name: AppRoutes.homePage, page: () => HomeScreen()),
        GetPage(name: AppRoutes.newOrderPage, page: () => NewOrderScreen()),
        GetPage(name: AppRoutes.orderListPage, page: () => OrderScreen()),
        GetPage(name: AppRoutes.newServicePage, page: () => NewServiceScreen()),
      ],
      home: SplashScreen(),
    );
  }
}
