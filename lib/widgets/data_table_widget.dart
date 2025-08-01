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

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: AppConstants.columnSpacing,
          dataRowMinHeight: AppConstants.dataRowMinHeight,
          dataRowMaxHeight: AppConstants.dataRowMaxHeight,
          headingRowHeight: AppConstants.headingRowHeight,
          columns: const [
            DataColumn(
              label: Text(
                AppStrings.idHeader,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppConstants.fontSizeSmall + 1),
              ),
            ),
            DataColumn(
              label: Text(
                AppStrings.nameHeader,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppConstants.fontSizeSmall + 1),
              ),
            ),
            DataColumn(
              label: Text(
                AppStrings.priceHeader,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppConstants.fontSizeSmall + 1),
              ),
            ),
            DataColumn(
              label: Text(
                AppStrings.stockHeader,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppConstants.fontSizeSmall + 1),
              ),
            ),
          ],
          rows: data.map((item) {
            return DataRow(
              cells: [
                DataCell(Text(item.id,
                    style:
                        const TextStyle(fontSize: AppConstants.fontSizeSmall))),
                DataCell(Text(item.name,
                    style:
                        const TextStyle(fontSize: AppConstants.fontSizeSmall))),
                DataCell(Text(item.price,
                    style:
                        const TextStyle(fontSize: AppConstants.fontSizeSmall))),
                DataCell(Text(item.stock,
                    style:
                        const TextStyle(fontSize: AppConstants.fontSizeSmall))),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
