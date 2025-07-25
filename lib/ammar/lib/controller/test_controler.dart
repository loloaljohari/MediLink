//   import 'package:Medical/core/class/statusrequest.dart';
// import 'package:Medical/core/functions/handlingdata_controler.dart';
// import 'package:Medical/data/data%20source/remote/test_data.dart';
// import 'package:get/get.dart';

// class TestController extends GetxController{

// TestData testData = TestData(Get.find());

// List data = [];

// late Statusrequest statusrequest ;

// getData () async {

// statusrequest=Statusrequest.loding;
// update();

// await Future.delayed(Duration(seconds: 5));


//  var response= await testData.getData();


// statusrequest= handlingData(response);   
// if (Statusrequest.success == statusrequest){
  
// if(response['status']=="success"){

// data.addAll(response['data']);

// }else{

// statusrequest= Statusrequest.failure;

// }


// }

// update();
// }
// @override
//   void onInit() {
//     getData();
//     super.onInit();
//   }

// }