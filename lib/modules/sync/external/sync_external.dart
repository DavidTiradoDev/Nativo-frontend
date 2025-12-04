import 'package:connectivity_plus/connectivity_plus.dart';

class SyncExternal {
  Future<List<ConnectivityResult>> validateConnection() async {
    return await Connectivity().checkConnectivity();
  }
}
