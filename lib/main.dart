import 'package:flutter/material.dart';
import 'package:metamask_connect/data/user_data.dart';
import 'package:metamask_connect/screens/metamask_connect.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MetaMaskProvider(),
      child: MaterialApp(
        title: 'Flutter Metamask Connect',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MetaMaskConnectScreen(),
      ),
    );
  }
}
