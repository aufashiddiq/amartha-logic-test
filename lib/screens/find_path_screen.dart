import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FindPathScreen extends StatefulWidget {
  static const routeName = '/find-path';
  const FindPathScreen({super.key});

  @override
  State<FindPathScreen> createState() => _FindPathScreenState();
}

class _FindPathScreenState extends State<FindPathScreen> {
  List<List<int>> blocks = [
    [0, 0, -1, -1, 0],
    [-1, 0, 0, -1, -1],
    [0, 0, 0, -1, 0],
    [-1, 0, 0, 0, 0],
    [0, 0, -1, 0, 0],
  ];

  late List<List<bool>> checked = List.generate(
    blocks.length,
    (index) => List.generate(
      blocks[index].length,
      (index) => false,
    ),
  );

  late List<List<String>> paths = [[]];

  bool? hasPath;

  bool checkAroundIsSafe(int x, int y) {
    if (x >= 0 && x < blocks.length && y >= 0 && y < blocks[0].length) {
      return true;
    }
    return false;
  }

  bool checkPath(int x, int y, {int deep = 0}) {
    if (checkAroundIsSafe(x, y) && blocks[x][y] == 0 && !checked[x][y]) {
      checked[x][y] = true;
      paths[paths.length - 1].add('$x$y');

      if (x == blocks.length - 1 && y == blocks[0].length - 1) {
        hasPath = true;
        return true;
      }

      if (checkPath(x - 1, y)) return true;
      if (checkPath(x, y - 1)) return true;
      if (checkPath(x + 1, y)) return true;
      if (checkPath(x, y + 1)) return true;
    }
    return false;
  }

  void checkEmptyArea() {
    checkPath(0, 0);
    print(paths.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Find Path between 2 dots')),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBlocks(),
            SizedBox(height: 32),
            MaterialButton(
              onPressed: checkEmptyArea,
              child: Text('Generate Path'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
            SizedBox(height: 32),
            Text(
              'Has Path? ${hasPath == true ? 'Yes' : hasPath == false ? 'No' : '-'}',
            ),
          ],
        ),
      ),
    );
  }

  Column _buildBlocks() {
    return Column(
      children: [
        for (int xIndex = 0; xIndex < blocks.length; xIndex++)
          Row(
            children: [
              for (int yIndex = 0; yIndex < blocks.length; yIndex++)
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: blocks[xIndex][yIndex] == -1
                        ? Colors.red
                        : blocks[xIndex][yIndex] == 1
                            ? Colors.green
                            : Colors.white70,
                    border: Border.all(color: Colors.black45, width: 2),
                  ),
                ),
            ],
          )
      ],
    );
  }
}
