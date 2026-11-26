import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_skeleton/data/storage/storage.dart';
import 'package:flutter_skeleton/domain/interactor/interactor.dart';

import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final Interactor _interactor;

  SplashBloc(this._interactor) : super(SplashInitialState()) {
    on<InitAppConfigEvent>((event, emit) async {
      emit(SplashLoadingState());

      try {
        final config = await _interactor.getAppConfig.invoke(
          platform: event.platform,
          version: event.version,
        );

        // Cache the app config in storage
        GetIt.I.get<StorageService>().appConfig = config;

        emit(SplashSuccessState(config));

        // Check if force update is required
        if (config.data?.version?.updateRequired == true) {
          emit(ForceUpdateRequiredState(config.data!.version!));
        } else {
          // Delay briefly for splash experience if needed
          await Future.delayed(const Duration(milliseconds: 1500));
          emit(GotoNextScreenState(config: config));
        }
      } catch (e) {
        final message = e is HttpException
            ? e.message
            : 'Failed to load app configuration';
        emit(SplashErrorState(message));

        // Even on error, after a delay, let user proceed using cached config or fallback
        await Future.delayed(const Duration(milliseconds: 1500));
        emit(GotoNextScreenState());
      }
    });
  }
}
