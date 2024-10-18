import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:com.morepos.morewin/app/constants/themes.dart';
import 'package:com.morepos.morewin/presentation/home/home_binding.dart';
import 'package:com.morepos.morewin/presentation/home/home_page.dart';

import '../app/util/web_scroll_behavior.dart';
import 'login/login_bindng.dart';
import 'login/login_pages.dart';

class App extends StatelessWidget {
  //  HomeBinding().dependencies();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/login",
      initialBinding: LoginBinding(), //HomeBinding(),
      debugShowCheckedModeBanner: false,
      theme: Themes.themeBlueOrange,
      scrollBehavior: WebScrollBehavior(),
      title: "Morepos distributes store",
      home: LoginPage(), //HomePage(),
    );
  }
}
