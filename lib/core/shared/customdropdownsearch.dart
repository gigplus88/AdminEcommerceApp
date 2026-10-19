import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:drop_down_list/drop_down_list.dart';

class CustomDropDownSearch<T> extends StatelessWidget {
  final List<T> items;
  final String Function(T item) getName;
  final String Function(T item) getValue;
  final Function(String id, String name) onSelected;
  final String title;
  final String searchHint;
  final String selectedText;

  const CustomDropDownSearch({
    super.key,
    required this.items,
    required this.getName,
    required this.getValue,
    required this.onSelected,
    this.title = "Choose Option",
    this.searchHint = "Search...",
    this.selectedText = "Your Category...",
  });

  void _showDropDown(BuildContext context) {
    final Map<String, String> mapNameToId = {};

    for (var item in items) {
      final name = getName(item);
      final id = getValue(item);
      mapNameToId[name] = id;
    }

    final uniqueNames = mapNameToId.keys.toList();

    List<SelectedListItem<String>> dropDownList = [];
    for (var name in uniqueNames) {
      dropDownList.add(SelectedListItem(data: name));
    }

    // 2. عرض الـ DropDown
    DropDownState<String>(
      dropDown: DropDown<String>(
        isDismissible: true,
        bottomSheetTitle: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        submitButtonText: "Done",
        clearButtonText: "Clear",
        searchHintText: searchHint,
        data: dropDownList,
        onSelected: (selectedItems) {
          if (selectedItems.isNotEmpty) {
            String selectedName = selectedItems.first.data ?? "";
            String selectedId = mapNameToId[selectedName] ?? "";

            onSelected(selectedId, selectedName);
          }
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showDropDown(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: title,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                selectedText.isEmpty ? "Your Category..." : selectedText,
                style: TextStyle(
                  color: selectedText.isEmpty ? Colors.grey : Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
