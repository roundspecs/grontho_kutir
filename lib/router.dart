import 'package:go_router/go_router.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

class Router {
  final AppUserCubit _appUserCubit;
  const Router(AppUserCubit appUserCubit) : _appUserCubit = appUserCubit;

  GoRouter get config {
    const authPaths = [SignInPage.path, SignUpPage.path];
    return GoRouter(
      initialLocation: '/',
      refreshListenable: _appUserCubit,
      redirect: (context, state) {
        final isAuthenticated = _appUserCubit.state is AppUserSuccess;
        final isAuthPath = authPaths.contains(state.fullPath);

        if (isAuthenticated) {
          if (isAuthPath) {
            return '/';
          }
          return null;
        } else {
          if (isAuthPath) {
            return null;
          }
          return SignInPage.path;
        }
      },
      routes: [
        ...coreRoutes,
        ...authRoutes,
      ],
    );
  }
}
