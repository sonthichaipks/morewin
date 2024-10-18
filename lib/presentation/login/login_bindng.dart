import 'package:get/get.dart';
// import 'package:com.morepos.morewin/domain/usecases/mng_db_use_case.dart';

import '../../data/repositories/medium_posts_repository_impl.dart';
// import '../../data/repositories/mngdb_repository_impl.dart';
import '../../data/repositories/mngdb_repository_impl.dart';
import '../../domain/usecases/fetch_user_posts_use_case.dart';
// import '../information/information_controller.dart';
import '../../domain/usecases/mng_db_use_case.dart';
import '../blog/blog_controller.dart';
import 'login_controller.dart';
// import 'login_controller.dart';
// import 'information_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchMngdbUseCase(Get.find<MngdbRepositoryIml>()));
    Get.put(LoginController());
  }
}
