import 'package:auth_app/core/device/device_id_provider.dart';
import 'package:auth_app/core/device/device_id_provider_impl.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassesAndPackagesInitialization {
  static final ClassesAndPackagesInitialization _instance =
      ClassesAndPackagesInitialization._internal();

  ClassesAndPackagesInitialization._internal();

  factory ClassesAndPackagesInitialization() {
    return _instance;
  }

  late final DeviceIdProvider deviceIdProvider;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final deviceInfo = DeviceInfoPlugin();
    deviceIdProvider = DeviceIdProviderImpl(prefs, deviceInfo);
    await deviceIdProvider.getDeviceId();
  }
}
