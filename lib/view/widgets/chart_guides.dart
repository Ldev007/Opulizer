import 'package:flutter/material.dart';

class ChartGuides extends StatelessWidget {
  const ChartGuides({super.key, required this.opinion});

  final String opinion;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 5,
          backgroundColor: opinion == 'yes' ? Colors.green : Colors.red,
          child: Icon(
            Icons.circle,
            color: Colors.white,
            size: Theme.of(context).iconTheme.size ?? 24 * 0.2,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          opinion.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize:
                    Theme.of(context).textTheme.labelSmall!.fontSize! * 0.6,
              ),
        ),
      ],
    );
  }
}
