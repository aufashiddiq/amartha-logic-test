import 'dart:math';

import 'package:amartha_logic_test/utils/maximum_area_utils.dart';
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

  late MaximumAreaUtils _maximumAreaUtils;

  @override
  void initState() {
    _maximumAreaUtils = MaximumAreaUtils(blocks);
    super.initState();
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
              onPressed: () {
                _maximumAreaUtils.checkMaximumArea();
                setState(() {});
              },
              child: Text('Count Maximum Area'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
            SizedBox(height: 32),
            Text(
                'Number of Island: ${_maximumAreaUtils.islandCount}\nMaximum Area: ${_maximumAreaUtils.maximumArea}'),
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
