import 'package:amartha_logic_test/utils/find_path_utils.dart';
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

  late FindPathUtils _findPathUtils;

  @override
  void initState() {
    _findPathUtils = FindPathUtils(blocks);
    super.initState();
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
              onPressed: () {
                _findPathUtils.checkPath();
                setState(() {});
              },
              child: Text('Generate Path'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
            SizedBox(height: 32),
            Text(
              'Has Path? ${_findPathUtils.hasPath == true ? 'Yes' : _findPathUtils.hasPath == false ? 'No' : '-'}',
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
