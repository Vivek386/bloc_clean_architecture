import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class RegisterController extends GetxController{

 late TextEditingController phoneController;
 late final TextEditingController pinController;

  @override
  void onInit() {
    // TODO: implement onInit
    phoneController = TextEditingController();
    pinController = TextEditingController();
    super.onInit();
  }

  RxBool isSendOTP = false.obs;
}