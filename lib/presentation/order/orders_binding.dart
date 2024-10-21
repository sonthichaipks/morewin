import 'package:com.morepos.morewin/presentation/order/orders_controller.dart';
import 'package:get/get.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderController());
  }
}
