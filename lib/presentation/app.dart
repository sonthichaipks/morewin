import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:com.morepos.morewin/app/constants/themes.dart';
// import 'package:com.morepos.morewin/presentation/home/home_binding.dart';
// import 'package:com.morepos.morewin/presentation/home/home_page.dart';

import '../app/constants/theme_provider.dart';
import '../app/util/web_scroll_behavior.dart';
// import 'login/login_bindng.dart';
// import 'login/login_pages.dart';

// import 'package:momostore/utils/core_package.dart';

import 'route/routes_controller.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _SplashScreenPage();
}

class _SplashScreenPage extends State<App> {
  // @override
  @override
  void initState() {
    // initAsyn();
    super.initState();
  }

  // Future initAsyn() async {
  //   Future.delayed(const Duration(seconds: 2)).then((value) => Get.toNamed(
  //         Routes.homepage,
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    // double fullWsize = Get.width;
    // double fullHsize = Get.height;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: mng_theme.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        dialogBackgroundColor: mng_theme.secondaryColor,
        dividerColor: mng_theme.secondaryColor,
      ),
      scrollBehavior: WebScrollBehavior(),
      title: "Morepos distributes store",
      getPages: Pages.routes,
      defaultTransition: Transition.native,
      initialRoute: '/login', //Routes.homepage,
    );
  }
}

// class App extends StatelessWidget {
//   //  HomeBinding().dependencies();
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       initialRoute: "/login",
//       initialBinding: HomeBinding(),
//       // LoginBinding(), //HomeBinding(),
//       debugShowCheckedModeBanner: false,
//       theme: Themes.themeBlueOrange,
//       scrollBehavior: WebScrollBehavior(),
//       title: "Morepos distributes store",
//       home: HomePage(),
//       //  LoginPage(), //HomePage(),
//     );
//   }
// }
