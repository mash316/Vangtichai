import 'package:flutter/material.dart';

class DenominationList extends StatelessWidget {
  final List<int> denominations;
  final Map<int, int> counts;

  const DenominationList({
    super.key,
    required this.denominations,
    required this.counts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: denominations.map((denomination) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            '$denomination : ${counts[denomination] ?? 0}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }
}
