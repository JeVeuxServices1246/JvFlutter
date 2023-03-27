import 'package:get/get.dart';
import 'package:jv_app/app/network/network_requester.dart';

class BaseRepository {
  NetworkRequester get controller => GetInstance().find<NetworkRequester>();
}
