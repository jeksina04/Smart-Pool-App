import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_skeleton/data/storage/storage.dart';
import 'package:flutter_skeleton/domain/interactor/interactor.dart';
import 'technician_dashboard_event.dart';
import 'technician_dashboard_state.dart';

class TechnicianDashboardBloc
    extends Bloc<TechnicianDashboardEvent, TechnicianDashboardState> {
  final Interactor _interactor;

  TechnicianDashboardBloc(this._interactor)
      : super(TechnicianDashboardInitialState()) {
    on<FetchTodayRoutesEvent>((event, emit) async {
      final storage = GetIt.I.get<StorageService>();

      // If we don't have data loaded in state yet, show cached offline data immediately if available
      final cachedRes = storage.todayRoutes;
      if (cachedRes?.data != null) {
        emit(TechnicianDashboardLoadedState(cachedRes!.data!));
      } else {
        emit(TechnicianDashboardLoadingState());
      }

      try {
        final response = await _interactor.getTechnicianTodayRoutes.invoke();

        if (response.data != null) {
          final data = response.data!;
          final routes = data.routes;
          final todayRoute = (routes != null && routes.isNotEmpty)
              ? routes.firstWhere((r) => r.isToday == true, orElse: () => routes.first)
              : null;

          final newPublishVersion = todayRoute?.publishVersion;
          final previousVersion = storage.cachedPublishVersion;

          // If publish_version went up, mark route as updated (for T25 sync status)
          if (previousVersion != null &&
              newPublishVersion != null &&
              newPublishVersion > previousVersion) {
            storage.isRouteUpdated = true;
          }

          if (newPublishVersion != null) {
            storage.cachedPublishVersion = newPublishVersion;
          }

          // Save offline copy of the entire day: routes, customers, checklists, catalog_items, reading_config, dosage_rules, permissions
          storage.todayRoutes = response;

          emit(TechnicianDashboardLoadedState(data));
        } else {
          // If response.data is null but we had cached data, keep state loaded
          if (cachedRes?.data == null) {
            emit(TechnicianDashboardErrorState(
              response.message ?? 'No route data found',
            ));
          }
        }
      } catch (e) {
        // If API call throws (e.g. offline/network error) and we have cached copy, keep showing it
        if (cachedRes?.data == null) {
          final errorMsg = e is HttpException
              ? e.message
              : 'Failed to load route details. Please try again.';
          emit(TechnicianDashboardErrorState(errorMsg));
        }
      }
    });

    on<FetchBadgesEvent>((event, emit) async {
      try {
        final response = await _interactor.getTechnicianBadges.invoke();
        if (response.data != null) {
          emit(TechnicianBadgesLoadedState(response.data!));
        }
      } catch (_) {
        // Silently ignore badge fetch error or keep previous counts
      }
    });
  }
}
