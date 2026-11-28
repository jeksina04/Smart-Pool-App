import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import '../api/api_service.dart';
import 'storage_constants.dart';
import '../../domain/model/login_model.dart';
import '../../domain/model/app_config_model.dart';
import '../../domain/model/technician_today_routes_model.dart';


class StorageService {
  final _box = Hive.box(box);

  bool hasData(String key) => _box.containsKey(key);

  String get authToken {
    return _box.get(authTokenKey) ?? "";
  }

  set authToken(String token) {
    _box.put(authTokenKey, token);
    GetIt.I.get<ApiService>().setAuthToken(token);
  }

  String get refreshToken {
    return _box.get(refreshTokenKey) ?? "";
  }

  set refreshToken(String token) {
    _box.put(refreshTokenKey, token);
  }

  Locale get appLocale {
    return Locale(_box.get(appLocaleKey) ?? "en");
  }

  set appLocale(Locale locale) {
    _box.put(appLocaleKey, locale.languageCode);
  }

  LoginResModel? get userInfo {
    final raw = _box.get(userInfoKey);
    if (raw == null) return null;
    try {
      return LoginResModel.fromJson(json.decode(raw));
    } catch (_) {
      return null;
    }
  }

  set userInfo(LoginResModel? loginModel) {
    if (loginModel == null) {
      _box.delete(userInfoKey);
    } else {
      _box.put(userInfoKey, json.encode(loginModel.toJson()));
    }
  }

  AppConfigResModel? get appConfig {
    final raw = _box.get(appConfigKey);
    if (raw == null) return null;
    try {
      return AppConfigResModel.fromJson(json.decode(raw));
    } catch (_) {
      return null;
    }
  }

  set appConfig(AppConfigResModel? config) {
    if (config == null) {
      _box.delete(appConfigKey);
    } else {
      _box.put(appConfigKey, json.encode(config.toJson()));
    }
  }

  String get userRole {
    final role = _box.get(userRoleKey);
    if (role != null && (role as String).isNotEmpty) return role;
    return userInfo?.data?.role ?? "";
  }

  set userRole(String role) {
    _box.put(userRoleKey, role);
  }

  String get techDeviceId {
    final id = _box.get(techDeviceIdKey);
    if (id != null && (id as String).isNotEmpty) return id;
    return userInfo?.data?.techDeviceId ?? userInfo?.data?.deviceId ?? "";
  }

  set techDeviceId(String id) {
    _box.put(techDeviceIdKey, id);
  }

  TechnicianTodayRoutesResModel? get todayRoutes {
    final raw = _box.get(todayRoutesKey);
    if (raw == null) return null;
    try {
      return TechnicianTodayRoutesResModel.fromJson(json.decode(raw));
    } catch (_) {
      return null;
    }
  }

  set todayRoutes(TechnicianTodayRoutesResModel? model) {
    if (model == null) {
      _box.delete(todayRoutesKey);
    } else {
      _box.put(todayRoutesKey, json.encode(model.toJson()));
    }
  }

  int? get cachedPublishVersion {
    return _box.get(cachedPublishVersionKey) as int?;
  }

  set cachedPublishVersion(int? version) {
    if (version == null) {
      _box.delete(cachedPublishVersionKey);
    } else {
      _box.put(cachedPublishVersionKey, version);
    }
  }

  bool get isRouteUpdated {
    return _box.get(routeUpdatedFlagKey) ?? false;
  }

  set isRouteUpdated(bool updated) {
    _box.put(routeUpdatedFlagKey, updated);
  }

  clear() async {
    try {
      GetIt.I.get<ApiService>().setAuthToken("");
    } catch (_) {}
    await _box.clear();
  }

  remove(String key) async => await _box.delete(key);

/*****listeners*****
    _box.watch(key: "").forEach((element) {});
 *******************/
}
