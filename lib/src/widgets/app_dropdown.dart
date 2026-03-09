import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AppDropdown extends StatelessWidget {
  final List<String> items;
  final String? value;
  final String hint;
  final ValueChanged<String?> onChanged;

  const AppDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.hint = "Select",
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        value: value,

        hint: Text(
          hint,
          style: TextStyle(fontSize: 14, color: Theme.of(context).hintColor),
        ),

        items: items.map((item) {
          return DropdownMenuItem<String>(value: item, child: Text(item));
        }).toList(),

        onChanged: onChanged,

        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.onPrimary,
            border: Border.all(color: Theme.of(context).dividerColor),
          ),
        ),

        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.onPrimary,
            border: Border.all(color: Theme.of(context).dividerColor),
          ),
        ),
      ),
    );
  }
}
