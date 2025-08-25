import 'package:flutter/material.dart';

class PageSelector extends StatelessWidget {
  final int totalPages;
  final int currentPage;

  const PageSelector({
    super.key,
    required this.totalPages,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.arrow_upward),
      onPressed: () {},
    );
  }
}
