import 'package:flutter/material.dart';
import 'package:metamask_connect/data/user_data.dart';
import 'package:metamask_connect/screens/home_screen.dart';
import 'package:provider/provider.dart';

class MetaMaskConnectScreen extends StatefulWidget {
  const MetaMaskConnectScreen({super.key});

  @override
  State<MetaMaskConnectScreen> createState() => _MetaMaskConnectScreenState();
}

class _MetaMaskConnectScreenState extends State<MetaMaskConnectScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MetaMaskProvider>(
      builder: (context, metaMaskProvider, _) {
        return Scaffold(
          body: (!metaMaskProvider.isLoggedIn())
              ? Center(
                  child: ElevatedButton(
                    onPressed: metaMaskProvider.loginWithMetaMask,
                    child: const Text('Connect to Metamask'),
                  ),
                )
              : const HomeScreen(),
        );
      },
    );
  }
}
