import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/style/my_colors.dart';

class PageSelector extends StatelessWidget {
  final int totalPages;
  final int currentPage;

  final ValueChanged<int>? onPageSelected;

  const PageSelector({
    super.key,
    required this.totalPages,
    required this.currentPage,
    this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButton<int>(
        alignment: Alignment.center,
        underline: SizedBox.shrink(),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        dropdownColor: MyColors.dropDownColor,
        menuMaxHeight: 200,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        menuWidth: 120,
        hint: Text(
          "Page $currentPage",
          style: TextStyle(
            color: MyColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        icon: Icon(
          Icons.arrow_drop_down,
          color: MyColors.iconColor,
        ),
        items: List.generate(
          totalPages,
          (i) => DropdownMenuItem(
            value: i + 1,
            alignment: Alignment.center,
            child: Text('Page ${i + 1}'),
          ),
        ),
        onChanged: (value) {
          if (value != null) {
            onPageSelected?.call(value);
          }
        },
      ),
    );
  }
}
