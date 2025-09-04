import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool? centerTile;

  const MyAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTile,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: actions,
      leading: leading,
      centerTitle: centerTile,
      automaticallyImplyLeading: false,
    );
  }
}
