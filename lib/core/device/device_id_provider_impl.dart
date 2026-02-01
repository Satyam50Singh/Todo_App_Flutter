import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'device_id_provider.dart';

class DeviceIdProviderImpl implements DeviceIdProvider {
  static const _key = 'device_id';
  String? _cachedDeviceId;

  final SharedPreferences _prefs;
  final DeviceInfoPlugin _deviceInfo;

  DeviceIdProviderImpl(this._prefs, this._deviceInfo);

  @override
  Future<String> getDeviceId() async {
    if (_cachedDeviceId != null) return _cachedDeviceId!;

    try {
      String? deviceId = _prefs.getString(_key);
      if (deviceId != null && deviceId.isNotEmpty) {
        _cachedDeviceId = deviceId;
        return deviceId;
      }

      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        deviceId = androidInfo.id;
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor;
      } else {
        deviceId = 'unknown_device';
      }

      await _prefs.setString(_key, deviceId ?? '');
      _cachedDeviceId = deviceId;

      debugPrint('Device ID: $deviceId');
      return deviceId ?? 'unknown_device';
    } on Exception catch (e) {
      debugPrint(e.toString());
      return '';
    }
  }
}
