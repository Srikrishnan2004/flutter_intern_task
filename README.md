# Flutter Landscape Dropdown Dashboard

A responsive Flutter application designed specifically for landscape orientation with 6 interactive dropdown sections and corresponding data tables.

## Features

- **Landscape-Only Layout**: Optimized for landscape orientation on mobile devices
- **6 Dropdown Sections**: Electronics, Clothing, Books, Food, Sports, and Home categories
- **Independent Data Tables**: Each dropdown displays its own unique data table when an item is selected
- **Responsive Design**: Adapts to different screen sizes while maintaining landscape orientation
- **Clean Architecture**: Well-organized code structure with separation of concerns
- **No Scrolling Required**: All 6 dropdowns are visible simultaneously without scrolling

## Project Structure

```
lib/
├── main.dart                    # App entry point
├── constants/
│   └── app_constants.dart       # App-wide constants and strings
├── models/
│   └── dropdown_data.dart       # Data models and dummy data
├── screens/
│   └── landscape_dropdown_screen.dart  # Main landscape screen
├── utils/
│   └── data_generator.dart      # Utility for generating dummy data
└── widgets/
    ├── dropdown_section.dart    # Reusable dropdown section widget
    └── data_table_widget.dart   # Reusable data table widget
```

## Architecture

### Models
- **DropdownData**: Contains all category data for the 6 dropdowns
- **TableDataModel**: Represents individual table row data

### Widgets
- **DropdownSection**: Reusable widget combining dropdown and data table
- **DataTableWidget**: Displays scrollable data tables with proper formatting

### Utils
- **DataGenerator**: Creates dummy data based on selected items and categories

### Constants
- **AppConstants**: Centralized styling constants (colors, sizes, spacing)
- **AppStrings**: Centralized text strings for consistency

## Technical Implementation

### Responsive Design
- Uses `Expanded` widgets for proper space distribution
- Flexible layout that adapts to different landscape screen sizes
- Proper padding and spacing using centralized constants

### State Management
- Independent state management for each dropdown
- Each dropdown selection triggers its own data table update
- Clean separation between UI state and data

### Performance Optimizations
- Efficient widget rebuilding with proper state management
- Scrollable data tables for handling larger datasets
- Optimized for landscape mobile view

### Orientation Handling
- Forces landscape orientation when screen loads
- Restores original orientation settings when leaving screen
- Uses `SystemChrome.setPreferredOrientations` for orientation control

## Usage

1. **Select Category**: Choose an item from any of the 6 dropdowns
2. **View Data**: Corresponding data table appears below the selected dropdown
3. **Independent Operation**: Each dropdown works independently
4. **Responsive**: Works across different landscape screen sizes

## Categories

1. **Electronics**: Computers, Smartphones, Tablets, Accessories
2. **Clothing**: Shirts, Pants, Shoes, Accessories
3. **Books**: Fiction, Non-Fiction, Textbooks, Comics
4. **Food**: Fruits, Vegetables, Snacks, Beverages
5. **Sports**: Football, Basketball, Tennis, Swimming
6. **Home**: Furniture, Appliances, Decor, Tools

## Data Structure

Each data table contains:
- **ID**: Unique identifier
- **Name**: Item name with category prefix
- **Price**: Formatted price with category-based calculation
- **Stock**: Available quantity

## Running the App

```bash
flutter run
```

The app will automatically orient to landscape mode and display the 6 dropdown dashboard.

## Requirements Met

✅ Single screen in landscape orientation only  
✅ 6 dropdown boxes visible simultaneously without scrolling  
✅ Independent dropdown-table functionality  
✅ No spacing between dropdown boxes  
✅ Proper alignment across various device sizes  
✅ Responsive and optimized for landscape mobile view  
✅ Appropriate Flutter widgets for responsive design  
✅ Independent state management for each dropdown-table pair  

## Future Enhancements

- Add real API integration for dynamic data
- Implement data persistence
- Add filtering and sorting capabilities
- Include data export functionality
- Add animation transitions
