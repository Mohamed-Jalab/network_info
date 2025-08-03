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
      HttpClientRequest client =
          await HttpClient().getUrl(Uri.parse("https://www.google.com"));

      HttpClientResponse res = await client.close();
      return res.statusCode == 200;
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      rethrow;
    }
  }
}
