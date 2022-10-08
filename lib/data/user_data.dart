import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

class MetaMaskProvider with ChangeNotifier {
  late WalletConnect _connector;
  SessionStatus? _sessionStatus;
  String? _userAddress;

  MetaMaskProvider() {
    initConnector();
  }

  bool isConnected() {
    if (_connector.connected) {
      return true;
    }
    return false;
  }

  bool isLoggedIn() {
    return _userAddress != null;
  }

  String getUserAddress() {
    if (_userAddress != null) {
      _userAddress;
    }
    return 'Not Found';
  }

  void initConnector() {
    _connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
        name: 'My App',
        description: 'An app for converting pictures to NFT',
        url: 'https://walletconnect.org',
        icons: [
          'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
        ],
      ),
    );
  }

  Future<void> loginWithMetaMask() async {
    if (!isConnected()) {
      try {
        _sessionStatus = await _connector.createSession(
          onDisplayUri: (uri) async {
            await launchUrlString(
              uri,
              mode: LaunchMode.externalApplication,
            );
          },
        );

        _userAddress = _sessionStatus!.accounts[0];
        notifyListeners();
      } catch (exp) {
        print(exp);
      }
    }
  }
}
