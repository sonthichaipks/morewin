import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morewin/presentation/blog/blog_page.dart';
import 'package:morewin/presentation/experiences/experiences_binding.dart';
import 'package:morewin/presentation/information/information_binding.dart';
import 'package:morewin/presentation/information/information_page.dart';
import '../../app/constants/themes.dart';
import '../about/about_binding.dart';
import '../about/about_page.dart';
import '../blog/blog_binding.dart';
import '../experiences/experiences_page.dart';
import '../information/information_controller.dart';
import '../login/login_bindng.dart';
import '../login/login_pages.dart';
import '../projects/projects_page.dart';
import '../projects/projets_binding.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxInt navBarSelectedIndex = 0.obs;
  RxList<Widget> pages = [
    InformationPage(),
    AboutPage(),
    LoginPage(), // ExperiencesPage(),
    ProjectsPage(),
    BlogPage()
  ].obs;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  final items = [
    'Home',
    'About',
    'Purchase',
    'Stock',
    'Order',
    'Help',
  ];

  void onIndexChanged() {
    switch (selectedIndex.value) {
      case 0:
        InformationBinding().dependencies();
        Get.changeTheme(Themes.themeBlueOrange);
        break;
      case 1:
        AboutBinding().dependencies();
        Get.changeTheme(Themes.themeBlackOrange);
        break;
      case 2:
        LoginBinding().dependencies();
        // ExperiencesBinding().dependencies();
        Get.changeTheme(Themes.themePurpleOrange);
        break;
      case 3:
        ProjectsBinding().dependencies();
        Get.changeTheme(Themes.themeOrangeOrange);
        break;
      case 4:
        BlogBinding().dependencies();
        Get.changeTheme(Themes.themeBlackOrange);
        break;
    }
  }

  @override
  void onInit() {
    Get.put(InformationController());
    super.onInit();
  }

  onNavbarItemSelected(int v) {
    selectedIndex.value = v;
    onIndexChanged();
    update();
  }

  infoPop(String title, String msg) {
    Get.defaultDialog(
      title: title,
      titleStyle: const TextStyle(color: Colors.red),
      middleText: msg,
    );
  }
}
