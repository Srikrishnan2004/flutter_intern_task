import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/dropdown_section.dart';
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
              // First row of dropdowns (3 dropdowns)
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    DropdownSection(
                      title: 'Electronics',
                      items: _dropdownData.categories1,
                      selectedValue: selectedCategory1,
                      onChanged: (value) =>
                          setState(() => selectedCategory1 = value),
                      categoryNumber: 1,
                    ),
                    DropdownSection(
                      title: 'Clothing',
                      items: _dropdownData.categories2,
                      selectedValue: selectedCategory2,
                      onChanged: (value) =>
                          setState(() => selectedCategory2 = value),
                      categoryNumber: 2,
                    ),
                    DropdownSection(
                      title: 'Books',
                      items: _dropdownData.categories3,
                      selectedValue: selectedCategory3,
                      onChanged: (value) =>
                          setState(() => selectedCategory3 = value),
                      categoryNumber: 3,
                    ),
                  ],
                ),
              ),
              // Second row of dropdowns (3 dropdowns)
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    DropdownSection(
                      title: 'Food',
                      items: _dropdownData.categories4,
                      selectedValue: selectedCategory4,
                      onChanged: (value) =>
                          setState(() => selectedCategory4 = value),
                      categoryNumber: 4,
                    ),
                    DropdownSection(
                      title: 'Sports',
                      items: _dropdownData.categories5,
                      selectedValue: selectedCategory5,
                      onChanged: (value) =>
                          setState(() => selectedCategory5 = value),
                      categoryNumber: 5,
                    ),
                    DropdownSection(
                      title: 'Home',
                      items: _dropdownData.categories6,
                      selectedValue: selectedCategory6,
                      onChanged: (value) =>
                          setState(() => selectedCategory6 = value),
                      categoryNumber: 6,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
