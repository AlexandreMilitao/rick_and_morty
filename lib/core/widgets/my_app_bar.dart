import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/style/my_colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final Widget? leading;

  const MyAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.appBarBackgroundColor,
      title: title,
      actions: actions,
      leading: leading,
      centerTitle: false,
      automaticallyImplyLeading: false,
    );
  }
}
