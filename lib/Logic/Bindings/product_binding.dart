import 'package:get/get.dart';
import '../Controller/prodect_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<ProdectController>(ProdectController());
  }
}
