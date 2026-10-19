import 'package:admin/bindings/initialbindings.dart';
import 'package:admin/core/localization/changelocal.dart';
import 'package:admin/core/localization/translation.dart';
import 'package:admin/routes.dart';
import 'package:admin/core/services/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: controller.appTheme,
      // home: //Test(),const Language(),
      //Method 2 : to remove sign up data when i move from it
      initialBinding: InitialBindings(),
      //routes: routes,
      getPages: routes,
    );
  }
}
