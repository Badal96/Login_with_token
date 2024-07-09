import 'package:apricotspace_task/config/router.gr.dart';
import 'package:apricotspace_task/data/services/guard.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter implements AutoRouteGuard {
  final AuthProvider authProvider;
  AppRouter({required this.authProvider});

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LandingRoute.page,
          path: '/landing',
        ),
        AutoRoute(
          path: '/forgot-password',
          page: ForgotPasswordRoute.page,
        ),
        AutoRoute(
          page: SignInRoute.page,
          path: '/sign-in',
        ),
        AutoRoute(
          page: SignUpRoute.page,
          path: '/sign-up',
        ),
        AutoRoute(
          page: VerifyRoute.page,
          path: '/verify',
        ),
        AutoRoute(
          initial: true,
          path: '/home',
          page: HomeRoute.page,
        )
      ];

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authProvider.getToken != null) {
      resolver.next();
    } else if (resolver.route.name == LandingRoute.name ||
        resolver.route.name == SignInRoute.name ||
        resolver.route.name == SignUpRoute.name ||
        resolver.route.name == VerifyRoute.name ||
        resolver.route.name == ForgotPasswordRoute.name) {
      resolver.next();
    } else {
      resolver.redirect(const LandingRoute());
    }
  }
}
