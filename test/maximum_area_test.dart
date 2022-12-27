import 'package:amartha_logic_test/utils/maximum_area_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Find Maximum area of island', () {
    List<List<int>> blocks = [
      [0, 0, 1, 1, 0],
      [1, 0, 0, 1, 1],
      [0, 0, 0, 1, 0],
      [1, 0, 0, 0, 0],
      [0, 0, 1, 0, 0],
    ];
    final MaximumAreaUtils utils = MaximumAreaUtils(blocks);
    utils.checkMaximumArea();
    expect(utils.maximumArea, 5);
  });
}
