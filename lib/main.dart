import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/app_initializer.dart';
import 'package:rick_and_morty/core/app_routes.dart';
import 'package:rick_and_morty/core/themes/my_theme.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInitializer.initializeDependencies();
  runApp(
    MaterialApp.router(
      theme: MyTheme().myTheme,
      routerConfig: AppRoutes.router,
      debugShowCheckedModeBanner: false,
    ),
  );
}
