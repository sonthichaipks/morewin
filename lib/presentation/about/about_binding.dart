import 'package:get/get.dart';
import 'package:com.morepos.morewin/data/repositories/images_repository_impl.dart';
import 'package:com.morepos.morewin/domain/usecases/fetch_person_images_use_case.dart';
import 'package:com.morepos.morewin/presentation/about/about_controller.dart';
// import 'package:com.morepos.morewin/presentation/home/home_controller.dart';
import 'package:com.morepos.morewin/presentation/information/information_controller.dart';
import '../../data/repositories/mngdb_repository_impl.dart';
import '../../domain/usecases/mng_db_use_case.dart';
import '../information/information_controller.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => (Get.find<MngdbRepositoryIml>()));

    Get.lazyPut(
        () => FetchPersonImagesUseCase(Get.find<ImagesRepositoryIml>()));
    Get.put(AboutController(Get.find()));
    // Get.lazyPut<InformationController>(() => InformationController());
  }
}
