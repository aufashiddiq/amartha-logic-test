import 'package:amartha_logic_test/screens/find_path_screen.dart';
import 'package:amartha_logic_test/screens/home_screen.dart';
import 'package:amartha_logic_test/screens/maximum_area_screen.dart';
import 'package:amartha_logic_test/screens/number_of_island_screen.dart';
import 'package:amartha_logic_test/screens/todo_list_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> routes(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreen.routeName:
      return AppPageRoute(builder: (_) => const HomeScreen());
    case FindPathScreen.routeName:
      return AppPageRoute(builder: (_) => const FindPathScreen());
    case MaximumAreaScreen.routeName:
      return AppPageRoute(builder: (_) => const MaximumAreaScreen());
    case NumberOfIslandScreen.routeName:
      return AppPageRoute(builder: (_) => const NumberOfIslandScreen());
    case TodoListScreen.routeName:
      return AppPageRoute(builder: (_) => const TodoListScreen());
    default:
      return AppPageRoute(builder: (_) => const HomeScreen());
  }
}

class AppPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  AppPageRoute({builder}) : super(builder: builder);
}
