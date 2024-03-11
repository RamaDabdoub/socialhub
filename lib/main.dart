import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:empty_code/app/my_app.dart';
import 'package:empty_code/core/data/repositry/shared_prefrence_repositry.dart';
import 'package:empty_code/core/services/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

 
  Get.put(ConnectivitySerivce());
  Get.put(Connectivity());
 

  await Get.putAsync<SharedPreferences>(
    () async {
      return await SharedPreferences.getInstance();
    },
  );

  Get.lazyPut(
    () => SharedPrefrenceRepository(),
  );
   
  //    Get.Put(
  //     CartService(),
  // );


  runApp(const MyApp());
}
