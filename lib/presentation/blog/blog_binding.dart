import 'package:get/get.dart';
import 'package:com.morepos.morewin/domain/usecases/fetch_user_posts_use_case.dart';

import '../../data/repositories/medium_posts_repository_impl.dart';
import 'blog_controller.dart';

class BlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BlogController(Get.find()));
    Get.lazyPut(
        () => FetchUserPostsUseCase(Get.find<MediumPostsRepositoryIml>()));
  }
}
