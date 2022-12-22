import 'package:amartha_logic_test/screens/find_path_screen.dart';
import 'package:amartha_logic_test/screens/maximum_area_screen.dart';
import 'package:amartha_logic_test/screens/number_of_island_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Amartha Logic Test')),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, FindPathScreen.routeName);
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Find Path between 2 dots'),
            ),
            SizedBox(height: 24),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, MaximumAreaScreen.routeName);
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Maximum area of island'),
            ),
            SizedBox(height: 24),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, NumberOfIslandScreen.routeName);
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Number of island'),
            ),
            SizedBox(height: 24)
          ],
        ),
      ),
    );
  }
}
