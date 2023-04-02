import 'package:get_storage/get_storage.dart';
import 'package:jv_app/app/data/models/dto/user_model.dart';

class Storage {
  Storage._privateConstructor();

  static final _box = GetStorage();

  static AppConfig getAppConfig() =>
      AppConfig.fromJson(_box.read(StorageKeys.APP_CONFIG));

  static void setAppConfig(AppConfig appConfig) =>
      _box.write(StorageKeys.APP_CONFIG, appConfig.toJson());

  static User getUser() => User.fromJson(_box.read(StorageKeys.USER));

  static void setUser(User? user) =>
      _box.write(StorageKeys.USER, user?.toJson());

  static bool isUserExists() => _box.read(StorageKeys.USER) != null;

  static void clear() async {
    _box.erase();
    print(isUserExists());
  }
}

class AppConfig {
  late String config;

  AppConfig({required this.config});

  AppConfig.fromJson(Map<String, dynamic> json) {
    config = json['config'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['config'] = this.config;
    return data;
  }
}

class StorageKeys {
  StorageKeys._privateConstructor();

  static const APP_CONFIG = 'app_config';
  static const USER = 'user';
}

