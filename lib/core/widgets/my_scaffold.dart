import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/style/my_colors.dart';
import 'package:rick_and_morty/core/widgets/my_app_bar.dart';

class MyScaffold extends StatelessWidget {
  final Widget? body;
  final MyAppBar? appBar;
  final Color? backgroundColor;
  const MyScaffold({super.key, this.body, this.appBar, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      backgroundColor: backgroundColor ?? MyColors.backgroundColor,
    );
  }
}
