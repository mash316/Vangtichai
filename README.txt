VangtiChai - Flutter Implementation

Project Overview:
VangtiChai is a currency denomination calculator for Bangladeshi Taka. It uses a custom keypad and a greedy algorithm to calculate the minimum number of notes for a given amount.

Flutter Version:
Latest Stable (3.x)

Folder Structure:
lib/
  main.dart: App entry point and theme configuration.
  screens/
    home_screen.dart: Main UI logic and orientation handling.
  services/
    change_calculator.dart: Greedy algorithm logic.
  widgets/
    amount_header.dart: Displays "Taka: <amount>".
    denomination_list.dart: Vertical list of denomination counts.
    keypad_button.dart: Reusable Material button for the keypad.
    portrait_keypad.dart: 3-column keypad for portrait mode.
    landscape_keypad.dart: 4-column keypad for landscape mode.
  models/
    denomination.dart: Data model for currency.

Greedy Algorithm:
The app calculates counts by iterating from the largest denomination (500) to the smallest (1). For each, it takes (remaining_amount ~/ denomination) and updates (remaining_amount %= denomination).

Responsive Design Approach:
- Used OrientationBuilder to switch between portrait and landscape layouts.
- Used Row/Column with Expanded/Flexible widgets to ensure the UI scales proportionally on phones (Pixel XL) and tablets (Nexus 10).
- Handled landscape mode by splitting denominations into two columns and using a 4-column keypad to maximize horizontal space.

State Preservation:
Amount and calculation results are stored in the _HomeScreenState class. Since it's a StatefulWidget, the data is preserved across orientation changes automatically by the Flutter framework.

Devices/Screens Tested:
1. Pixel XL (411 x 731 dp) - Portrait & Landscape
2. Nexus 10 (800 x 1280 dp) - Portrait & Landscape
3. Custom Emulator: Pixel_XL_assignment
4. Generic Android Tablet (10-inch)
5. Generic Android Phone (6-inch)
