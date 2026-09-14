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

  Locale get appLocale {
    return Locale(_box.get(appLocaleKey) ?? "en");
  }

  set appLocale(Locale locale) {
    _box.put(appLocaleKey, locale.languageCode);
  }

  LoginResModel get userInfo {
    return LoginResModel.fromJson(json.decode(_box.get(userInfoKey)));
  }

  set userInfo(LoginResModel loginModel) {
    _box.put(userInfo, json.encode(loginModel.toJson()));
  }

  clear() async => await _box.clear();

  remove(String key) async => await _box.delete(key);

/*****listeners*****
    _box.watch(key: "").forEach((element) {});
 *******************/
}
