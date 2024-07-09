import 'package:flutter/material.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final screenDimensions = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.cyan),
        color: Colors.black,
      ),
      padding: EdgeInsets.fromLTRB(
        screenDimensions.width * 0.05,
        screenDimensions.height * 0.05,
        screenDimensions.width * 0.05,
        screenDimensions.width * 0.04,
      ),
      margin: EdgeInsets.symmetric(vertical: screenDimensions.height * 0.25),
      child: child,
    );
  }
}
