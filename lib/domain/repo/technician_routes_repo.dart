import '../model/technician_badges_model.dart';
import '../model/technician_today_routes_model.dart';
import 'technician_routes_data_source.dart';

class TechnicianRoutesRepo {
  final TechnicianRoutesDataSource dataSource;

  TechnicianRoutesRepo(this.dataSource);

  Future<TechnicianTodayRoutesResModel> getTodayRoutes() {
    return dataSource.getTodayRoutes();
  }

  Future<TechnicianBadgesResModel> getBadges() {
    return dataSource.getBadges();
  }
}
