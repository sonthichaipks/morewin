import 'package:get/get.dart';
import 'package:morewin/presentation/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => SignUpUseCase(Get.find<AuthenticationRepositoryIml>()));
    Get.put(HomeController());
  }
}
