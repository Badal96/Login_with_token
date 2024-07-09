// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:apricotspace_task/view/pages/forgot_password/forgot_password_page.dart'
    as _i1;
import 'package:apricotspace_task/view/pages/home/home_page.dart' as _i2;
import 'package:apricotspace_task/view/pages/landing/landing_page.dart' as _i3;
import 'package:apricotspace_task/view/pages/login/login_page.dart' as _i4;
import 'package:apricotspace_task/view/pages/sign_up/sign_up_page.dart' as _i5;
import 'package:apricotspace_task/view/pages/verify_code/verification_page.dart'
    as _i6;
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>(
          orElse: () => const ForgotPasswordRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ForgotPasswordPage(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    LandingRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LandingPage(),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.SignInPage(key: args.key),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.SignUpPage(key: args.key),
      );
    },
    VerifyRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.VerifyPage(
          key: args.key,
          email: args.email,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ForgotPasswordPage]
class ForgotPasswordRoute extends _i7.PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordRoute.name,
          args: ForgotPasswordRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i7.PageInfo<ForgotPasswordRouteArgs> page =
      _i7.PageInfo<ForgotPasswordRouteArgs>(name);
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LandingPage]
class LandingRoute extends _i7.PageRouteInfo<void> {
  const LandingRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SignInPage]
class SignInRoute extends _i7.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i7.PageInfo<SignInRouteArgs> page =
      _i7.PageInfo<SignInRouteArgs>(name);
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.SignUpPage]
class SignUpRoute extends _i7.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i7.PageInfo<SignUpRouteArgs> page =
      _i7.PageInfo<SignUpRouteArgs>(name);
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.VerifyPage]
class VerifyRoute extends _i7.PageRouteInfo<VerifyRouteArgs> {
  VerifyRoute({
    _i8.Key? key,
    required String email,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          VerifyRoute.name,
          args: VerifyRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'VerifyRoute';

  static const _i7.PageInfo<VerifyRouteArgs> page =
      _i7.PageInfo<VerifyRouteArgs>(name);
}

class VerifyRouteArgs {
  const VerifyRouteArgs({
    this.key,
    required this.email,
  });

  final _i8.Key? key;

  final String email;

  @override
  String toString() {
    return 'VerifyRouteArgs{key: $key, email: $email}';
  }
}
