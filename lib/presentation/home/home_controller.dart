import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:com.morepos.morewin/presentation/blog/blog_page.dart';
import 'package:com.morepos.morewin/presentation/experiences/experiences_binding.dart';
// import 'package:com.morepos.morewin/presentation/information/information_binding.dart';
import 'package:com.morepos.morewin/presentation/information/information_page.dart';
// import '../../app/constants/themes.dart';
// import '../about/about_binding.dart';
import '../../app/constants/themes.dart';
import '../about/about_binding.dart';
import '../about/about_page.dart';
// import '../blog/blog_binding.dart';
import '../blog/blog_binding.dart';
import '../experiences/experiences_page.dart';
import '../information/information_binding.dart';
import '../information/information_controller.dart';
import '../login/login_bindng.dart';
import '../login/login_pages.dart';
import '../projects/projects_page.dart';
import '../projects/projets_binding.dart';
import '../route/routes_controller.dart';
import 'home_binding.dart';
// import '../projects/projets_binding.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxInt navBarSelectedIndex = 0.obs;

  RxBool helloSeen = false.obs;
  RxBool nameSeen = false.obs;
  RxBool positionSeen = false.obs;
  RxBool abstractSeen = false.obs;
  RxBool showName = false.obs;
  RxBool showPosition = false.obs;
  RxBool showAbstract = false.obs;
  RxBool showHireMe = false.obs;
  RxBool hovered = false.obs;

  RxList<Widget> pages = [
    InformationPage(),
    AboutPage(),
    FirebaseAuth.instance.currentUser != null ? ExperiencesPage() : LoginPage(),
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

  void onIndexChanged(RxInt _selectedIndex) {
    selectedIndex = _selectedIndex;
    switch (selectedIndex.value) {
      case 0:
        Get.changeTheme(Themes.themeBlueOrange);
        HomeBinding().dependencies();
        Get.toNamed(Routes.homepage);

        break;
      case 1:
        AboutBinding().dependencies();

        Get.changeTheme(Themes.themeBlackOrange);
        Get.toNamed(Routes.about);
        break;
      case 2:
        goToExperience();
        break;
      case 3:
        ProjectsBinding().dependencies();

        Get.changeTheme(Themes.themeOrangeOrange);
        FirebaseAuth.instance.currentUser != null
            ? Get.toNamed(Routes.project)
            : Get.toNamed(Routes.loginpage);
        break;
      case 4:
        BlogBinding().dependencies();

        Get.changeTheme(Themes.themeBlackOrange);
        FirebaseAuth.instance.currentUser != null
            ? Get.toNamed(Routes.blog)
            : Get.toNamed(Routes.loginpage);
        break;
    }
  }

  goToExperience() {
    try {
      // ExperiencesBinding().dependencies();

      Get.changeTheme(Themes.themePurpleOrange);
      FirebaseAuth.instance.currentUser != null
          ? Get.toNamed(Routes.loginpage)
          : Get.toNamed(Routes.experience);
    } on FirebaseException {
      Get.toNamed(Routes.loginpage);
    }
  }

  @override
  void onInit() {
    Get.put(InformationController());
    super.onInit();
  }

  onNavbarItemSelected(int v) {
    selectedIndex.value = v;
    onIndexChanged(selectedIndex);
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
