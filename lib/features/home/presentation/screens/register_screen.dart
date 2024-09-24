import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:gorouter/features/home/presentation/screens/register_controller.dart';
import 'package:pinput/pinput.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
    final controller = Get.put(RegisterController());
    return  Scaffold(
      body: Stack(
        children: [
         Obx(() =>  Container(
           height: Get.height,
           width: Get.width,
           color: Colors.blueAccent,
           child: SingleChildScrollView(
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 SizedBox(
                   height: 250,
                 ),
                 Container(
                   padding: const EdgeInsets.symmetric(horizontal: 15),
                   height: Get.height * 0.7,
                   width: Get.width,
                   decoration: const BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(15),
                       topRight: Radius.circular(15),
                     ),
                   ),
                   child:  Column(
                     children: [

                       Padding(
                         padding: EdgeInsets.symmetric(vertical: 10.0),
                         child: Row(
                           children: [
                             Icon(Icons.phone),
                             SizedBox(width: 15,),
                             Text("Phone number",style: TextStyle(fontSize: 18),),
                           ],
                         ),
                       ),

                       Row(
                         children: [
                           Container(
                             height: 50,
                             width: 50,
                             decoration: BoxDecoration(
                                 color: Colors.grey.withOpacity(0.3),
                                 borderRadius: BorderRadius.circular(15)
                             ),
                             child: Center(
                               child: Text("+91"),
                             ),
                           ),
                           SizedBox(width: 20,),
                           Expanded(child: TextField(
                             controller: controller.phoneController,
                             decoration: InputDecoration(
                                 hintText: "Please enter phone number"
                             ),
                           ))
                         ],
                       ),

                       controller.isSendOTP.value
                       ? Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: Pinput(
                           // You can pass your own SmsRetriever implementation based on any package
                           // in this example we are using the SmartAuth

                           controller: controller.pinController,

                           validator: (value) {
                             return value == '2222' ? null : 'Pin is incorrect';
                           },
                           hapticFeedbackType: HapticFeedbackType.lightImpact,
                           onCompleted: (pin) {
                             debugPrint('onCompleted: $pin');
                           },
                           onChanged: (value) {
                             debugPrint('onChanged: $value');
                           },
                           cursor: Column(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Container(
                                 margin: const EdgeInsets.only(bottom: 9),
                                 width: 22,
                                 height: 1,
                                 color: focusedBorderColor,
                               ),
                             ],
                           ),

                         ),
                       )

                        :SizedBox(),
                       GestureDetector(
                         onTap: (){
                           controller.isSendOTP.value = true;
                          controller.update();
                         },
                         child: Container(
                           margin: EdgeInsets.symmetric(vertical: 15),
                           padding: EdgeInsets.symmetric(vertical: 15),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(15),
                             color: Colors.blueAccent,
                           ),
                           child: Center(
                             child: Text(controller.isSendOTP.value ? "Register" : "Send OTP",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                           ),
                         ),
                       )
                     ],
                   ),
                 )

               ],
             ),
           ),
         ),

         )
        ],
      )


    );
  }
}
