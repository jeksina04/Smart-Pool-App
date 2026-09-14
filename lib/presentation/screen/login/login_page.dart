import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/base/base_widget.dart';
import 'package:flutter_skeleton/presentation/screen/login/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../data/storage/storage.dart';
import '../../../domain/interactor/interactor.dart';
import '../../custom/custom_bloc_consumer.dart';
import '../../service/navigation.dart';
import '../register/register_args.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

class LoginPage extends BaseWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => LoginBloc(GetIt.I.get<Interactor>()),
        child: CustomBlocConsumer<LoginBloc, UiState>(
          listener: (context, state) {
            if (state is SuccessState) {
              navigation.push(Routes.register,
                  arguments: RegisterArgs("Smoke"));
            }
          },
          builder: (context, state) => Scaffold(
            body: Center(
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(UserLoginEvent('', ''));
                        },
                        child: Text(context.getString('login')),
                      ),
                      10.verticalSpace,
                      ElevatedButton(
                        onPressed: () {
                          var newLocale = const Locale('ar');

                          EzLocalizationBuilder.of(context)!
                              .changeLocale(newLocale);
                          GetIt.I<StorageService>().appLocale = newLocale;
                        },
                        child: const Text('Change language'),
                      )
                    ],
                  ),
                  if (state is LoadingState) const CircularProgressIndicator()
                ],
              ),
            ),
          ),
        ));
  }
}
