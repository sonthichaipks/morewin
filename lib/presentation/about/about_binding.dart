import 'package:get/get.dart';
import 'package:morewin/data/repositories/images_repository_impl.dart';
import 'package:morewin/domain/usecases/fetch_person_images_use_case.dart';
import 'package:morewin/presentation/about/about_controller.dart';
// import 'package:morewin/presentation/home/home_controller.dart';
import 'package:morewin/presentation/information/information_controller.dart';
import '../information/information_controller.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => FetchPersonImagesUseCase(Get.find<ImagesRepositoryIml>()));
    Get.put(AboutController(Get.find()));
    // Get.lazyPut<InformationController>(() => InformationController());
  }
}
