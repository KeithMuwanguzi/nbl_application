import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbl/core/themes/apptheme.dart';
import 'package:nbl/core/themes/text_styles.dart';
import 'package:nbl/core/util/responsive.dart';
import 'package:nbl/features/1_authentication/presentation/login.dart';

//Things to remember
//The screen size of the samsung I am working with is
//Height:853.7143
//Width:411.4286

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context: context);
    TextStyles styles = TextStyles(res: responsive);

    AppTheme appTheme = AppTheme(styles: styles);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme.theme,
      home: const LoginPage(),
    );
  }
}
