import 'package:bot_toast/bot_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:empty_code/core/data/repositry/shared_prefrence_repositry.dart';
import 'package:empty_code/core/services/connectivity_service.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

void customLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 247, 103, 103).withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        width: screenWidth(4),
        height: screenWidth(4),
        child: SpinKitCircle(
          color: AppColors.graylightColor,
          size: screenWidth(8),
        ),
      );
    });


bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isComplexPassword(String password) {
  RegExp regex = RegExp(r'^.*(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#\$&*~]).*$'
      // r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$',
      );
  return regex.hasMatch(password);
}

bool isUsernameValid(String username) {
  // return RegExp(r"^[a-zA-Z]+$").hasMatch(username);
  return RegExp(r"^[a-zA-Z0-9_]+$").hasMatch(username);
}

double screenWidth(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.width / percent;
  else
    return Get.size.height / percent;
}

double screenHeight(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.height / percent;
  else
    return Get.size.width / percent;
}

SharedPrefrenceRepository get storage => Get.find<
    SharedPrefrenceRepository>(); // الفايند بتتعامل مع النوع فبقلا روحي جيبيلي هاد الاوبجيكت
ConnectivitySerivce get connectivitySerivce => Get.find<ConnectivitySerivce>();
Connectivity get connectivity => Get.find<Connectivity>();

// CartService get cartserivce => Get.find<CartService>();

bool isOnline = true;
