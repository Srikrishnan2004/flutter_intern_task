import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/data_table_widget.dart';
import '../models/dropdown_data.dart';
import '../constants/app_constants.dart';

class LandscapeDropdownScreen extends StatefulWidget {
  const LandscapeDropdownScreen({super.key});

  @override
  State<LandscapeDropdownScreen> createState() =>
      _LandscapeDropdownScreenState();
}

class _LandscapeDropdownScreenState extends State<LandscapeDropdownScreen> {
  // State variables for each dropdown
  String? selectedCategory1;
  String? selectedCategory2;
  String? selectedCategory3;
  String? selectedCategory4;
  String? selectedCategory5;
  String? selectedCategory6;

  // Instance of dropdown data
  final DropdownData _dropdownData = DropdownData();

  @override
  void initState() {
    super.initState();
    // Force landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    // Reset orientation when leaving this screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appTitle),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingSmall),
          child: Column(
            children: [
              // Dropdowns in a single horizontal row
              Container(
                height: 80, // Fixed height for dropdown row
                child: Row(
                  children: [
                    _buildDropdownWithTable(
                      'Electronics',
                      _dropdownData.categories1,
                      selectedCategory1,
                      (value) => setState(() {
                        selectedCategory1 = value;
                      }),
                      1,
                    ),
                    _buildDropdownWithTable(
                      'Clothing',
                      _dropdownData.categories2,
                      selectedCategory2,
                      (value) => setState(() {
                        selectedCategory2 = value;
                      }),
                      2,
                    ),
                    _buildDropdownWithTable(
                      'Books',
                      _dropdownData.categories3,
                      selectedCategory3,
                      (value) => setState(() {
                        selectedCategory3 = value;
                      }),
                      3,
                    ),
                    _buildDropdownWithTable(
                      'Food',
                      _dropdownData.categories4,
                      selectedCategory4,
                      (value) => setState(() {
                        selectedCategory4 = value;
                      }),
                      4,
                    ),
                    _buildDropdownWithTable(
                      'Sports',
                      _dropdownData.categories5,
                      selectedCategory5,
                      (value) => setState(() {
                        selectedCategory5 = value;
                      }),
                      5,
                    ),
                    _buildDropdownWithTable(
                      'Home',
                      _dropdownData.categories6,
                      selectedCategory6,
                      (value) => setState(() {
                        selectedCategory6 = value;
                      }),
                      6,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Table area below dropdowns
              Expanded(
                child: Row(
                  children: [
                    _buildTableArea(selectedCategory1, 1, 'Electronics'),
                    _buildTableArea(selectedCategory2, 2, 'Clothing'),
                    _buildTableArea(selectedCategory3, 3, 'Books'),
                    _buildTableArea(selectedCategory4, 4, 'Food'),
                    _buildTableArea(selectedCategory5, 5, 'Sports'),
                    _buildTableArea(selectedCategory6, 6, 'Home'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build dropdown without integrated table (just the dropdown part)
  Widget _buildDropdownWithTable(
    String title,
    List<String> items,
    String? selectedValue,
    Function(String?) onChanged,
    int categoryNumber,
  ) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 2), // Small spacing between dropdowns
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        child: Container(
          padding: const EdgeInsets.all(AppConstants.paddingSmall),
          decoration: BoxDecoration(
            color: AppConstants.primaryColor.shade50,
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppConstants.fontSizeMedium,
                ),
              ),
              const SizedBox(height: AppConstants.paddingSmall),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: selectedValue,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.paddingSmall, vertical: 4),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    filled: true,
                    fillColor: AppConstants.backgroundColor,
                  ),
                  hint: const Text(
                    AppStrings.selectItemHint,
                    style: TextStyle(fontSize: AppConstants.fontSizeSmall),
                  ),
                  isExpanded: true,
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                            fontSize: AppConstants.fontSizeSmall),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build the table area for each dropdown
  Widget _buildTableArea(
      String? selectedItem, int categoryNumber, String categoryTitle) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        padding: const EdgeInsets.all(AppConstants.paddingSmall),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          color: Colors.white,
        ),
        child: selectedItem != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$categoryTitle',
                    style: const TextStyle(
                      fontSize: AppConstants.fontSizeMedium,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    selectedItem,
                    style: const TextStyle(
                      fontSize: AppConstants.fontSizeSmall,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingSmall),
                  Expanded(
                    child: DataTableWidget(
                      selectedItem: selectedItem,
                      categoryNumber: categoryNumber,
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(), // Empty space when no selection
      ),
    );
  }
}
