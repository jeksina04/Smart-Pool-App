import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import '../api/api_service.dart';
import 'storage_constants.dart';
import '../../domain/model/login_model.dart';

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

  clear() async => await _box.clear();

  remove(String key) async => await _box.delete(key);

/*****listeners*****
    _box.watch(key: "").forEach((element) {});
 *******************/
}
