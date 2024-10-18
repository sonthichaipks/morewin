import 'package:get/get.dart';

import '../about/about_binding.dart';
import '../about/about_page.dart';
import '../blog/blog_binding.dart';
import '../blog/blog_page.dart';
import '../experiences/experiences_binding.dart';
import '../experiences/experiences_page.dart';
import '../home/home_binding.dart';
import '../home/home_page.dart';
import '../information/information_binding.dart';
import '../information/information_page.dart';
import '../login/login_bindng.dart';
import '../login/login_pages.dart';
import '../projects/projects_page.dart';
import '../projects/projets_binding.dart';

class Routes {
  Routes._();
  static const String homepage = '/';
  static const String about = '/about';
  static const String loginpage = '/login';
  static const String blog = '/blog';
  static const String inform = '/information';
  static const String experience = '/experience';
  static const String project = '/project';
}

class Pages {
  Pages._();
  static final List<GetPage> routes = [
    GetPage(
      name: Routes.homepage,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.about,
      page: () => AboutPage(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: Routes.loginpage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.blog,
      page: () => BlogPage(),
      binding: BlogBinding(),
    ),
    GetPage(
      name: Routes.inform,
      page: () => InformationPage(),
      binding: InformationBinding(),
    ),
    GetPage(
      name: Routes.experience,
      page: () => ExperiencesPage(),
      binding: ExperiencesBinding(),
    ),
    GetPage(
      name: Routes.project,
      page: () => ProjectsPage(),
      binding: ProjectsBinding(),
    ),
  ];
}
