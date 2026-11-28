import '../model/technician_badges_model.dart';
import '../repo/technician_routes_repo.dart';

class GetTechnicianBadges {
  final TechnicianRoutesRepo _repo;

  GetTechnicianBadges(this._repo);

  Future<TechnicianBadgesResModel> invoke() {
    return _repo.getBadges();
  }
}
