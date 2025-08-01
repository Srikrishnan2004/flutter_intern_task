import 'package:flutter/material.dart';
import '../models/dropdown_data.dart';
import '../utils/data_generator.dart';
import '../constants/app_constants.dart';

class DataTableWidget extends StatelessWidget {
  final String selectedItem;
  final int categoryNumber;

  const DataTableWidget({
    super.key,
    required this.selectedItem,
    required this.categoryNumber,
  });

  @override
  Widget build(BuildContext context) {
    // Generate dummy data based on selected item and category
    List<TableDataModel> data =
        DataGenerator.generateDummyData(selectedItem, categoryNumber);

    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width / 6 -
                  32, // Dropdown width minus padding
            ),
            child: DataTable(
              columnSpacing: 8, // Reduced spacing to fit better
              dataRowMinHeight: AppConstants.dataRowMinHeight,
              dataRowMaxHeight: AppConstants.dataRowMaxHeight,
              headingRowHeight: AppConstants.headingRowHeight,
              columns: const [
                DataColumn(
                  label: Expanded(
                    child: Text(
                      AppStrings.idHeader,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppConstants.fontSizeSmall + 1),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      AppStrings.nameHeader,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppConstants.fontSizeSmall + 1),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      AppStrings.priceHeader,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppConstants.fontSizeSmall + 1),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      AppStrings.stockHeader,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppConstants.fontSizeSmall + 1),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
              rows: data.map((item) {
                return DataRow(
                  cells: [
                    DataCell(
                      Container(
                        constraints: BoxConstraints(maxWidth: 40),
                        child: Text(
                          item.id,
                          style: const TextStyle(
                              fontSize: AppConstants.fontSizeSmall),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        constraints: BoxConstraints(maxWidth: 80),
                        child: Text(
                          item.name,
                          style: const TextStyle(
                              fontSize: AppConstants.fontSizeSmall),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        constraints: BoxConstraints(maxWidth: 50),
                        child: Text(
                          item.price,
                          style: const TextStyle(
                              fontSize: AppConstants.fontSizeSmall),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        constraints: BoxConstraints(maxWidth: 40),
                        child: Text(
                          item.stock,
                          style: const TextStyle(
                              fontSize: AppConstants.fontSizeSmall),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
