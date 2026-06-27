# VangtiChai

VangtiChai is a Flutter application that calculates the minimum number of Bangladeshi Taka notes required for a given amount using the Greedy Change-Making Algorithm.

## Features

- **Custom Numeric Keypad**: Input is accepted only through a custom-built keypad. No system keyboard is used.
- **Real-time Calculation**: Denomination counts are updated instantly as you type.
- **Responsive Design**: Support for both Portrait and Landscape orientations on phones and tablets.
- **State Preservation**: Current amount and counts are preserved during device rotation.
- **Bangladeshi Denominations**: Supports 500, 100, 50, 20, 10, 5, 2, and 1 Taka notes.

## Project Structure

```text
lib/
├── main.dart                 # Entry point of the app
├── screens/
│   └── home_screen.dart      # Main screen with layout switching logic
├── services/
│   └── change_calculator.dart # Greedy algorithm implementation
└── widgets/
    ├── amount_header.dart     # Displays the current Taka amount
    ├── denomination_list.dart # Reusable list for denomination counts
    ├── keypad_button.dart     # Custom button for the keypad
    ├── portrait_keypad.dart   # 3-column keypad layout for portrait mode
    └── landscape_keypad.dart  # 4-column keypad layout for landscape mode
```

## Greedy Algorithm

The application uses the Greedy Change-Making Algorithm to find the minimum number of notes. It iterates through denominations in descending order (500, 100, 50, 20, 10, 5, 2, 1) and takes as many of each denomination as possible.

## Responsive Design Approach

- **OrientationBuilder**: Used to detect screen orientation and switch between portrait and landscape layouts.
- **Expanded/Flexible**: Used to ensure widgets take up proportional space without overlapping or clipping.
- **LayoutBuilder**: (Implicitly handled via Row/Column flex) Ensures the UI adapts to different screen sizes like Pixel XL and Nexus 10.

## State Preservation

State is managed within a `StatefulWidget` in `HomeScreen`. Since Flutter's default behavior preserves the state of a `StatefulWidget` when rebuilding for orientation changes (as long as the widget remains in the tree), the amount and counts are naturally preserved.

## Supported Devices Tested

- Phone (Pixel XL)
- Tablet (Nexus 10)

## Getting Started

1. Ensure you have Flutter installed (Latest Stable).
2. Run `flutter pub get` to install dependencies.
3. Run `flutter run` to start the application.
