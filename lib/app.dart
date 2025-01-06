import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'bindings/general_bindings.dart';
import 'routes/app_routes.dart';
import 'utils/constants/colors.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light, //ThemeMode.system,
      title: 'Pizza',
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: Image.asset('assets/pizzas/8.png', height: 120, width: 120),
        ),
      ),
    );
  }
}
