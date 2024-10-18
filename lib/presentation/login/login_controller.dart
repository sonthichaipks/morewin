// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LoginController extends GetxController with GetTickerProviderStateMixin {
//   RxBool helloSeen = false.obs;
//   RxBool nameSeen = false.obs;
//   RxBool positionSeen = false.obs;
//   RxBool abstractSeen = false.obs;
//   RxBool showName = false.obs;
//   RxBool showPosition = false.obs;
//   RxBool showAbstract = false.obs;
//   RxBool showHireMe = false.obs;
//   RxBool hovered = false.obs;
// }
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:com.morepos.morewin/presentation/home/home_page.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:com.morepos.morewin/domain/entities/medium_posts_response.dart';
import 'package:com.morepos.morewin/domain/usecases/fetch_user_posts_use_case.dart';

import '../../app/constants/themes.dart';
import '../../data/models/mngdata/QryTables.dart';
import '../../data/repositories/mngdb_repository_impl.dart';
import '../../domain/entities/mngdb_posts_response.dart';
import '../../domain/usecases/mng_db_use_case.dart';
import '../about/about_binding.dart';
import '../about/about_page.dart';
import '../blog/blog_binding.dart';
import '../blog/blog_page.dart';
import '../experiences/experiences_binding.dart';
import '../experiences/experiences_page.dart';
import '../home/home_binding.dart';
import '../home/home_controller.dart';
import '../information/information_binding.dart';
import '../information/information_page.dart';
import '../projects/projects_page.dart';
import '../projects/projets_binding.dart';
import '../route/routes_controller.dart';
import '../widgets/custom_snackbar.dart';
import 'login_bindng.dart';
import 'login_pages.dart';

class LoginController extends GetxController with GetTickerProviderStateMixin {
  LoginController();
  final totalRepo = MngdbRepositoryIml();

  final HomeController navCtrl = HomeController();
  List<PrQryTables> listQryAboutProductModel = [];
  String _tagName = "flutter";

  late FetchMngdbUseCase _fetchmngdbUseCase;
  Rx<MngDbPostsResponse?>? mngDbResponse = Rx<MngDbPostsResponse?>(null);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    fetchMngdbPosts();
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }

  fetchMngdbPosts() async {
    Either response = await _fetchmngdbUseCase.execute(_tagName);
    response.fold((left) {
      CustomSnackBar.show(Get.context!, left.message, ContentType.failure);
    }, (right) {
      mngDbResponse!.value = right;
      update();
    });
  }

  Future<List<PrQryTables>> getAboutProductTablesWith(String filter) async {
    // if (aboutprodno.isEmpty) {
    //   aboutprodno = '3';
    // }
    listQryAboutProductModel =
        await totalRepo.getPrQryTablesWithFilter(filter, '3', filter);
    return listQryAboutProductModel;
  }

  // RxInt selectedIndex = 0.obs;
  // RxInt navBarSelectedIndex = 0.obs;
  // void onIndexChanged() {
  //   switch (selectedIndex.value) {
  //     case 0:
  //       HomeBinding().dependencies();

  //       Get.changeTheme(Themes.themeBlueOrange);
  //       Get.toNamed(Routes.homepage);
  //       break;
  //     case 1:
  //       AboutBinding().dependencies();

  //       Get.changeTheme(Themes.themeBlackOrange);
  //       Get.toNamed(Routes.about);
  //       break;
  //     case 2:
  //       ExperiencesBinding().dependencies();

  //       Get.changeTheme(Themes.themePurpleOrange);
  //       FirebaseAuth.instance.currentUser != null
  //           ? Get.toNamed(Routes.experience)
  //           : Get.toNamed(Routes.loginpage);
  //       break;
  //     case 3:
  //       ProjectsBinding().dependencies();

  //       Get.changeTheme(Themes.themeOrangeOrange);
  //       FirebaseAuth.instance.currentUser != null
  //           ? Get.toNamed(Routes.project)
  //           : Get.toNamed(Routes.loginpage);
  //       break;
  //     case 4:
  //       BlogBinding().dependencies();

  //       Get.changeTheme(Themes.themeBlackOrange);
  //       FirebaseAuth.instance.currentUser != null
  //           ? Get.toNamed(Routes.blog)
  //           : Get.toNamed(Routes.loginpage);
  //       break;
  //   }
  // }
}
