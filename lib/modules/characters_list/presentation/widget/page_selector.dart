import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/style/colors.dart';

class PageSelector extends StatelessWidget {
  final int totalPages;

  final ValueChanged<int>? onPageSelected;

  const PageSelector({
    super.key,
    required this.totalPages,

    this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      color: MyColors.color5,
      padding: EdgeInsets.zero,
      child: FloatingActionButton(
        backgroundColor: MyColors.color5,
        onPressed: null,
        child: Icon(Icons.arrow_drop_up, color: MyColors.color1),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          enabled: false,
          child: SizedBox(
            width: 50,
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: totalPages,
              itemBuilder: (context, index) {
                return TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('${index + 1}'),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
