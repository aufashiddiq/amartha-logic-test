import 'package:amartha_logic_test/utils/number_of_island_utils.dart';
import 'package:flutter/material.dart';

class NumberOfIslandScreen extends StatefulWidget {
  static const routeName = '/number-of-island';
  const NumberOfIslandScreen({super.key});

  @override
  State<NumberOfIslandScreen> createState() => _NumberOfIslandScreenState();
}

class _NumberOfIslandScreenState extends State<NumberOfIslandScreen> {
  final List<List<int>> blocks = [
    [0, 0, 1, 1, 0],
    [1, 0, 0, 1, 1],
    [0, 0, 0, 0, 0],
    [1, 0, 0, 1, 0],
    [0, 0, 0, 0, 0],
  ];

  late NumberOfIslandUtils _numberOfIslandUtils;

  @override
  void initState() {
    _numberOfIslandUtils = NumberOfIslandUtils(blocks);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Number of island')),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBlocks(),
            SizedBox(height: 32),
            MaterialButton(
              onPressed: () {
                _numberOfIslandUtils.countIsland();
                setState(() {});
              },
              child: Text('Count Island'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
            SizedBox(height: 32),
            Text('Number of Island: ${_numberOfIslandUtils.islandCount}'),
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
