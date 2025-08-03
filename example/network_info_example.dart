import 'package:network_info/network_info.dart';

void main() async {
  NetworkInfo networkInfo = NetworkInfo.instance;
  print(await networkInfo.isConnected);
}
