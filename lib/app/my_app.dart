import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/app/my_app_controller.dart';
import 'package:empty_code/core/enums/connectivity_status.dart';
import 'package:empty_code/core/translation/app_translation.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/details_post/details_post_view.dart';
import 'package:empty_code/ui/views/home_post/home_allpost.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     MyAppController controller = Get.put(MyAppController());
    //StreamProvider الفكرة منه يخلي هاد الستريم يكون موجود على مستوى الماتيريال اب كاملة يعني من اي مكان قادر اوصل للقيمة الموجودة بهاد الستريم
    // يقعد يراقب هاد الستريم اذا صار فيه قيمة جديدي ولا لاStreamProvider وهوي من مكتبة البروفايدر
    // الستريم بيتحسس لالو الابليكشن وقت تتغير القيمة بقلبو واذا ماتغير شي ماباثر على الابليكيشن وكانو ماموجود
    return StreamProvider<ConnectivityStatus>(
       create: (context) =>
      //  لح اعمل كرييت ل ليسنينغ على هاد الستريم البدك ياه
       //connectivitySerivce  هي اجت من ال ديبيندنسي انجيكشن
          connectivitySerivce.connectivityStatusController.stream,// هون انفتح الستريم وصار يعمل برودكاست على مستوى الابليكيشن
      // مابيقبل بدون قيمة بدائية مع انو متل قلتا
    //  لح ياخد اول قيمة لالو لما نفتح الستريم يعملو برودكاست وياخد القيمة الموجودة بقلبو
      initialData: ConnectivityStatus.OFFLINE,
      child: GetMaterialApp(
          locale: getLocal(), //مسؤولي عن اتجاه الخط LTR RTL
          translations: AppTranslation(),
          debugShowCheckedModeBanner: false,
          builder: BotToastInit(), //1. call BotToastInit
          navigatorObservers: [BotToastNavigatorObserver()],
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: AppColors.grayColor, // لون المؤشر
            ),
          ),
         home: PostHome())
          // home: SplashView()),
    );
    // home: IntroView());
    // home: LoginView());
  }
}

Locale getLocal() {
  String langCode = storage.getAppLanguage();

  if (langCode == 'ar')
    return Locale('ar', 'SA');
  else if (langCode == 'en')
    return Locale('en', 'US');
  else
    return Locale('fr', 'FR');
}
