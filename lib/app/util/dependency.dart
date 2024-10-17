import 'package:get/get.dart';
import 'package:morewin/data/repositories/images_repository_impl.dart';

import '../../data/repositories/images_repository_impl.dart';
import '../../data/repositories/medium_posts_repository_impl.dart';

class DenpendencyCreator {
  static init() {
    Get.lazyPut(() => ImagesRepositoryIml());
    Get.lazyPut(() => MediumPostsRepositoryIml());
  }
}
