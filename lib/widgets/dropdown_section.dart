import 'package:flutter/material.dart';
import 'data_table_widget.dart';
import '../constants/app_constants.dart';

class DropdownSection extends StatelessWidget {
  final String title;
  final List<String> items;
  final String? selectedValue;
  final Function(String?) onChanged;
  final int categoryNumber;

  const DropdownSection({
    super.key,
    required this.title,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.categoryNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(0), // No spacing between dropdowns
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Dropdown section
            Container(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              decoration: BoxDecoration(
                color: AppConstants.primaryColor.shade50,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppConstants.borderRadius),
                  topRight: Radius.circular(AppConstants.borderRadius),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppConstants.fontSizeLarge,
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingSmall),
                  DropdownButtonFormField<String>(
                    value: selectedValue,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.paddingMedium,
                          vertical: AppConstants.paddingSmall),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      filled: true,
                      fillColor: AppConstants.backgroundColor,
                    ),
                    hint: const Text(AppStrings.selectItemHint),
                    isExpanded: true,
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: AppConstants.fontSizeMedium),
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                    onChanged: onChanged,
                  ),
                ],
              ),
            ),
            // Data table section
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(AppConstants.paddingSmall),
                child: selectedValue != null
                    ? DataTableWidget(
                        selectedItem: selectedValue!,
                        categoryNumber: categoryNumber,
                      )
                    : const Center(
                        child: Text(
                          AppStrings.selectItemMessage,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: AppConstants.fontSizeMedium,
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
