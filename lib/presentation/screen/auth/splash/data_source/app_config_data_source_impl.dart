import 'package:flutter_skeleton/data/api/api_caller.dart';
import 'package:flutter_skeleton/data/api/api_constants.dart' as api_constants;
import 'package:flutter_skeleton/domain/model/app_config_model.dart';
import 'package:flutter_skeleton/domain/repo/app_config_data_source.dart';

class AppConfigDataSourceImpl extends AppConfigDataSource with ApiCaller {
  @override
  Future<AppConfigResModel> getAppConfig({
    required String platform,
    required String version,
  }) async {
    final Map<String, dynamic> queryParams = {
      'platform': platform,
      'version': version,
    };

    var data = await execute(
      apiCaller.get(
        url: api_constants.appConfig,
        queryParams: queryParams,
      ),
    );

    return AppConfigResModel.fromJson(data);
  }
}
