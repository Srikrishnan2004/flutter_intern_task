import '../models/dropdown_data.dart';

class DataGenerator {
  static List<TableDataModel> generateDummyData(
      String selectedItem, int categoryNumber) {
    // Generate different dummy data based on the selected item and category
    List<TableDataModel> data = [];

    for (int i = 1; i <= 5; i++) {
      data.add(TableDataModel(
        id: '${categoryNumber}0$i',
        name: '$selectedItem Item $i',
        price: '\$${(i * 10 + categoryNumber * 5).toStringAsFixed(2)}',
        stock: '${i * 2 + categoryNumber}',
      ));
    }

    return data;
  }
}
