import 'package:get/get.dart';
import 'package:com.morepos.morewin/presentation/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
