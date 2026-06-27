import 'package:flutter/material.dart';
import '../services/change_calculator.dart';
import '../widgets/amount_header.dart';
import '../widgets/denomination_list.dart';
import '../widgets/portrait_keypad.dart';
import '../widgets/landscape_keypad.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _amountString = '';
  Map<int, int> _counts = {};

  void _onDigitPressed(String digit) {
    setState(() {
      // Prevent leading zeros
      if (_amountString == '0' && digit == '0') return;
      if (_amountString == '0' && digit != '0') {
        _amountString = digit;
      } else {
        _amountString += digit;
      }
      _calculateChange();
    });
  }

  void _onClearPressed() {
    setState(() {
      _amountString = '';
      _counts = {};
    });
  }

  void _calculateChange() {
    if (_amountString.isEmpty) {
      _counts = {};
      return;
    }
    int amount = int.tryParse(_amountString) ?? 0;
    _counts = ChangeCalculator.calculate(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('VangtiChai', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return _buildPortraitLayout();
          } else {
            return _buildLandscapeLayout();
          }
        },
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
      children: [
        AmountHeader(amount: _amountString),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: DenominationList(
                    denominations: ChangeCalculator.denominations,
                    counts: _counts,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: PortraitKeypad(
                      onDigitPressed: _onDigitPressed,
                      onClearPressed: _onClearPressed,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout() {
    return Column(
      children: [
        AmountHeader(amount: _amountString),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: DenominationList(
                    denominations: const [500, 100, 50, 20],
                    counts: _counts,
                  ),
                ),
                Expanded(
                  child: DenominationList(
                    denominations: const [10, 5, 2, 1],
                    counts: _counts,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: LandscapeKeypad(
                      onDigitPressed: _onDigitPressed,
                      onClearPressed: _onClearPressed,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
