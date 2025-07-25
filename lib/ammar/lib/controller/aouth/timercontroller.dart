import 'dart:async';
import 'package:get/get.dart';

class TimerController extends GetxController {
  RxInt seconds = 60.obs;
  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    seconds.value = 60;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    startTimer();
  }

  @override
  void onInit() {
    super.onInit();
    startTimer(); // ✅ شغل التايمر هنا وليس في build
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
