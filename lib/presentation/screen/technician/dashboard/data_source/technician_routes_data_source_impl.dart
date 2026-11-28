import 'package:flutter_skeleton/data/api/api_caller.dart';
import 'package:flutter_skeleton/data/api/api_constants.dart' as api_constants;
import 'package:flutter_skeleton/domain/model/technician_badges_model.dart';
import 'package:flutter_skeleton/domain/model/technician_today_routes_model.dart';
import 'package:flutter_skeleton/domain/repo/technician_routes_data_source.dart';

class TechnicianRoutesDataSourceImpl extends TechnicianRoutesDataSource with ApiCaller {
  @override
  Future<TechnicianTodayRoutesResModel> getTodayRoutes() async {
    var data = await execute(
      apiCaller.get(
        url: api_constants.technicianTodayRoutes,
      ),
    );

    return TechnicianTodayRoutesResModel.fromJson(data);
  }

  @override
  Future<TechnicianBadgesResModel> getBadges() async {
    var data = await execute(
      apiCaller.get(
        url: api_constants.technicianBadges,
      ),
    );

    return TechnicianBadgesResModel.fromJson(data);
  }
}
