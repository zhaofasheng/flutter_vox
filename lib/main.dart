import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';


import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: Routes.TABBAR_VIEW,
      getPages: AppPages.routes,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
    ),
  );
}
