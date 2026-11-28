import '../model/technician_badges_model.dart';
import '../model/technician_today_routes_model.dart';

abstract class TechnicianRoutesDataSource {
  Future<TechnicianTodayRoutesResModel> getTodayRoutes();
  Future<TechnicianBadgesResModel> getBadges();
}
