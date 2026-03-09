import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class MultiSelectDropdown extends StatefulWidget {
  final List<String> items;
  final List<String> selectedItems;
  final ValueChanged<List<String>> onChanged;
  final String hint;

  const MultiSelectDropdown({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onChanged,
    this.hint = "Select",
  });

  @override
  State<MultiSelectDropdown> createState() => _MultiSelectDropdownState();
}

class _MultiSelectDropdownState extends State<MultiSelectDropdown> {
  late List<String> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = List.from(widget.selectedItems);
  }

  void _onItemTapped(String item, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.remove(item);
      } else {
        _selectedItems.add(item);
      }
    });

    widget.onChanged(_selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,

        hint: Text(
          widget.hint,
          style: TextStyle(fontSize: 14, color: Theme.of(context).hintColor),
        ),

        items: widget.items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            enabled: false,
            child: StatefulBuilder(
              builder: (context, menuSetState) {
                final isSelected = _selectedItems.contains(item);

                return InkWell(
                  onTap: () {
                    _onItemTapped(item, isSelected);
                    menuSetState(() {});
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        value: isSelected,
                        onChanged: (_) {
                          _onItemTapped(item, isSelected);
                          menuSetState(() {});
                        },
                      ),
                      Expanded(child: Text(item)),
                    ],
                  ),
                );
              },
            ),
          );
        }).toList(),

        value: _selectedItems.isEmpty ? null : _selectedItems.last,

        selectedItemBuilder: (context) {
          return widget.items.map((item) {
            return Container(
              alignment: Alignment.centerLeft,
              child: Text(
                _selectedItems.isEmpty
                    ? widget.hint
                    : _selectedItems.join(", "),
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList();
        },

        onChanged: (_) {},

        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.onPrimary,
            border: Border.all(color: Colors.grey.shade300),
          ),
        ),

        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.onPrimary,
            border: Border.all(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}
