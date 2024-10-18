import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:com.morepos.morewin/domain/entities/medium_posts_response.dart';
import 'package:com.morepos.morewin/domain/usecases/fetch_user_posts_use_case.dart';

import '../widgets/custom_snackbar.dart';

class BlogController extends GetxController with GetTickerProviderStateMixin {
  BlogController(this._fetchUserPostsUseCase);

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
  late FetchUserPostsUseCase _fetchUserPostsUseCase;
  Rx<MediumPostsResponse?>? mediumPostsResponse =
      Rx<MediumPostsResponse?>(null);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    fetchUserPosts();
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }

  fetchUserPosts() async {
    Either response = await _fetchUserPostsUseCase.execute(_tagName);
    response.fold((left) {
      CustomSnackBar.show(Get.context!, left.message, ContentType.failure);
    }, (right) {
      mediumPostsResponse!.value = right;
      update();
    });
  }
}
