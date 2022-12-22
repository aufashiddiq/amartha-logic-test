import 'dart:math';

import 'package:flutter/material.dart';

class MaximumAreaScreen extends StatefulWidget {
  static const routeName = '/maximum-area';
  const MaximumAreaScreen({super.key});

  @override
  State<MaximumAreaScreen> createState() => _MaximumAreaScreenState();
}

class _MaximumAreaScreenState extends State<MaximumAreaScreen> {
  List<List<int>> blocks = [
    [0, 0, 1, 1, 0],
    [1, 0, 0, 1, 1],
    [0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
  ];

  int islandCount = 0;
  List<int> islandCellCount = [];
  int maximumArea = 0;

  void checkAround(x, y) {
    int m = blocks.length;
    int n = blocks[0].length;

    if (x < 0 || y < 0 || x >= m || y >= n) {
      return;
    }

    if (blocks[x][y] == 1) {
      blocks[x][y] = 2;
      islandCellCount[islandCount - 1] += 1;

      checkAround(x - 1, y);
      checkAround(x, y - 1);
      checkAround(x, y + 1);
      checkAround(x + 1, y);
    }
  }

  void checkMaximumArea() {
    for (int x = 0; x < blocks.length; x++) {
      for (int y = 0; y < blocks[x].length; y++) {
        if (blocks[x][y] == 1) {
          islandCount++;
          islandCellCount.add(0);
          checkAround(x, y);
        }
      }
    }
    setState(() {});
    maximumArea = islandCellCount.reduce(max);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Maximum area of island')),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBlocks(),
            SizedBox(height: 32),
            MaterialButton(
              onPressed: checkMaximumArea,
              child: Text('Count Maximum Area'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
            SizedBox(height: 32),
            Text('Number of Island: $islandCount\nMaximum Area: $maximumArea'),
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
                    color: blocks[xIndex][yIndex] == 1 ||
                            blocks[xIndex][yIndex] == 2
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
