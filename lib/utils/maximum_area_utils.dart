import 'dart:math';

class MaximumAreaUtils {
  List<List<int>> blocks;

  MaximumAreaUtils(this.blocks);

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
    maximumArea = islandCellCount.reduce(max);
  }
}
