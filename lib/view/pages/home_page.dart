import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: FilledButton(
                onPressed: () {},
                child: const Text('Chart-1'),
              ),
            ),
            Flexible(
              child: FilledButton(
                onPressed: () {},
                child: const Text('Chart-2'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
