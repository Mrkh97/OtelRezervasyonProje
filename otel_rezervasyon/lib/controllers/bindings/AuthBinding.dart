import 'package:get/get.dart';
import 'package:otel_rezervasyon/controllers/AuthController.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController());
  }
}
