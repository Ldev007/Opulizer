import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opulizer/firebase_options.dart';
import 'package:opulizer/utils/constants.dart';
import 'package:opulizer/view/pages/chart_page.dart';
import 'package:opulizer/view/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: appTheme,
      home: ProviderScope(
        child: ChartPage(),
      ),
    );
  }
}
