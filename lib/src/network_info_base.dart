import "dart:io";

abstract class NetworkInfoBase {
  Future<bool> get isConnected;
}

class NetworkInfo implements NetworkInfoBase {
  const NetworkInfo._();

  static NetworkInfo get instance => NetworkInfo._();

  static NetworkInfo get I => NetworkInfo._();

  @override
  Future<bool> get isConnected async {
    try {
      final result = await InternetAddress.lookup("google.com");
      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      rethrow;
    }
  }
}
