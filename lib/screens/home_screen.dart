import 'package:flutter/material.dart';
import 'package:metamask_connect/data/user_data.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MetaMaskProvider>(
      builder: (context, metaMaskProvider, __) {
        return Scaffold(
          appBar: AppBar(),
          body: Text(
            metaMaskProvider.getUserAddress(),
          ),
        );
      },
    );
  }
}
