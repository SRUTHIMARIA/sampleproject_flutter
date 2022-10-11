// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../ui/home_screen/home.dart' as _i1;
import '../../ui/second_screen/second_screen.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    Home.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Home());
    },
    SecondScreen.name: (routeData) {
      final args = routeData.argsAs<SecondScreenArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.SecondScreen(name: args.name, id: args.id, key: args.key));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(Home.name, path: '/'),
        _i3.RouteConfig(SecondScreen.name, path: '/second-screen')
      ];
}

/// generated route for
/// [_i1.Home]
class Home extends _i3.PageRouteInfo<void> {
  const Home() : super(Home.name, path: '/');

  static const String name = 'Home';
}

/// generated route for
/// [_i2.SecondScreen]
class SecondScreen extends _i3.PageRouteInfo<SecondScreenArgs> {
  SecondScreen({required String name, int id = 1, _i4.Key? key})
      : super(SecondScreen.name,
            path: '/second-screen',
            args: SecondScreenArgs(name: name, id: id, key: key));

  static const String name = 'SecondScreen';
}

class SecondScreenArgs {
  const SecondScreenArgs({required this.name, this.id = 1, this.key});

  final String name;

  final int id;

  final _i4.Key? key;

  @override
  String toString() {
    return 'SecondScreenArgs{name: $name, id: $id, key: $key}';
  }
}
