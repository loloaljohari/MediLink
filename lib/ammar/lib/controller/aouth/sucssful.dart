
import 'package:MediLink/ammar/lib/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class Sussfulcontroller extends GetxController {
  gotologin();
  back1();
}

class SussfulcontrollerImp extends Sussfulcontroller {
  @override
  gotologin() {
    Get.offNamed(Approut.login);
  }

  @override
  back1() {
    Get.offNamed(Approut.verfaicodesinup);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
