import 'package:apricotspace_task/config/router.dart';
import 'package:apricotspace_task/config/theme.dart';
import 'package:apricotspace_task/data/services/guard.dart';
import 'package:apricotspace_task/view/pages/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:apricotspace_task/view/pages/home/cubit/home_cubit.dart';
import 'package:apricotspace_task/view/pages/login/cubit/login_cubit.dart';
import 'package:apricotspace_task/view/pages/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'injector/injector.dart' as service_locator;
import 'injector/injector.dart';

void main() async {
  service_locator.call();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await sl<AuthProvider>().checkUserLocalData();

  FlutterNativeSplash.remove();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(authProvider: sl());
    final theme = AppTheme.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(local: sl(), auth: sl()),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(authProvider: sl(), local: sl(), client: sl()),
        ),
        BlocProvider<ForgotPasswordCubit>(
          create: (context) => ForgotPasswordCubit(client: sl()),
        ),
        BlocProvider<SignUpCubit>(
          create: (context) => SignUpCubit(localData: sl(), client: sl()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme.copyWith(
          textTheme: theme.textTheme.copyWith()
            ..apply(
              fontFamily: 'Roboto',
            ),
          colorScheme: theme.colorScheme.copyWith(primary: AppColors.buttonBlack),
        ),
        routerConfig: appRouter.config(
          reevaluateListenable: sl<AuthProvider>(),
        ),
      ),
    );
  }
}
