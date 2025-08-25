import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/app_initializer.dart';
import 'package:rick_and_morty/core/app_routes.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInitializer.initializeDependencies();
  runApp(
    MaterialApp.router(
      routerConfig: AppRoutes.router,
      debugShowCheckedModeBanner: false,
    ),
  );
}
