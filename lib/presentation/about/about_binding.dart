import 'package:get/get.dart';
import 'package:com.morepos.morewin/presentation/about/about_controller.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AboutController());
  }
}
