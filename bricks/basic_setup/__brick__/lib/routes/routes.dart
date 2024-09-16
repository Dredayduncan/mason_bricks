import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:{{project-name}}/home/home_screen.dart';
import 'package:{{project-name}}/setup/setup.dart';
part 'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: HomeRoute.page, path: '/home', initial: true),
    ];
  }


}

extension PageRouteInfoAutoRouteExtension on PageRouteInfo {
  String getPath({AppRouter? router}) {
    return (router ?? getIt.get<AppRouter>())
        .routes
        .firstWhere(
          (route) => route.page.name == routeName,
          orElse: () => throw Exception(
            'No matching AutoRoute found for $routeName',
          ),
        )
        .path;
  }
}