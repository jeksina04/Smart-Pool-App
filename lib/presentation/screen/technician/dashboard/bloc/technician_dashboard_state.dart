import 'package:flutter_skeleton/domain/model/technician_badges_model.dart';
import 'package:flutter_skeleton/domain/model/technician_today_routes_model.dart';

abstract class TechnicianDashboardState {}

class TechnicianDashboardInitialState extends TechnicianDashboardState {}

class TechnicianDashboardLoadingState extends TechnicianDashboardState {}

class TechnicianDashboardLoadedState extends TechnicianDashboardState {
  final TechnicianTodayRoutesData routesData;

  TechnicianDashboardLoadedState(this.routesData);
}

class TechnicianBadgesLoadedState extends TechnicianDashboardState {
  final TechnicianBadgesData badgesData;

  TechnicianBadgesLoadedState(this.badgesData);
}

class TechnicianDashboardErrorState extends TechnicianDashboardState {
  final String message;

  TechnicianDashboardErrorState(this.message);
}
