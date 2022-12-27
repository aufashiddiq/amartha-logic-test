import 'package:amartha_logic_test/utils/find_path_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Find path between 2 dots test', () {
    List<List<int>> blocks = [
      [0, 0, -1, -1, 0],
      [-1, 0, 0, -1, -1],
      [0, 0, 0, -1, 0],
      [-1, 0, 0, 0, 0],
      [0, 0, -1, 0, 0],
    ];
    final FindPathUtils _findPathUtils = FindPathUtils(blocks);
    _findPathUtils.checkPath();
    expect(_findPathUtils.hasPath, true);
  });
}
