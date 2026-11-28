import '../model/technician_today_routes_model.dart';
import '../repo/technician_routes_repo.dart';

class GetTechnicianTodayRoutes {
  final TechnicianRoutesRepo _repo;

  GetTechnicianTodayRoutes(this._repo);

  Future<TechnicianTodayRoutesResModel> invoke() {
    return _repo.getTodayRoutes();
  }
}
