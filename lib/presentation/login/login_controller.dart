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
import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:morewin/domain/entities/medium_posts_response.dart';
import 'package:morewin/domain/usecases/fetch_user_posts_use_case.dart';

import '../../data/models/mngdata/QryTables.dart';
import '../../data/repositories/mngdb_repository_impl.dart';
import '../../domain/entities/mngdb_posts_response.dart';
import '../../domain/usecases/mng_db_use_case.dart';
import '../widgets/custom_snackbar.dart';

class LoginController extends GetxController with GetTickerProviderStateMixin {
  LoginController();
  final totalRepo = MngdbRepositoryIml();
  List<PrQryTables> listQryAboutProductModel = [];
  String _tagName = "flutter";

  RxBool helloSeen = false.obs;
  RxBool nameSeen = false.obs;
  RxBool positionSeen = false.obs;
  RxBool abstractSeen = false.obs;
  RxBool showName = false.obs;
  RxBool showPosition = false.obs;
  RxBool showAbstract = false.obs;
  RxBool showHireMe = false.obs;
  RxBool hovered = false.obs;

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
}
