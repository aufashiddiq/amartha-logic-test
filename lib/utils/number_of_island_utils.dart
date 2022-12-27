class NumberOfIslandUtils {
  List<List<int>> blocks;

  NumberOfIslandUtils(this.blocks);

  int islandCount = 0;

  void checkAround(x, y) {
    int m = blocks.length;
    int n = blocks[0].length;

    if (x < 0 || y < 0 || x >= m || y >= n) {
      return;
    }

    if (blocks[x][y] == 1) {
      blocks[x][y] = 2;

      checkAround(x - 1, y - 1);
      checkAround(x - 1, y);
      checkAround(x - 1, y + 1);
      checkAround(x, y - 1);
      checkAround(x, y + 1);
      checkAround(x + 1, y - 1);
      checkAround(x + 1, y);
      checkAround(x + 1, y + 1);
    }
  }

  void countIsland() {
    for (int x = 0; x < blocks.length; x++) {
      for (int y = 0; y < blocks[x].length; y++) {
        if (blocks[x][y] == 1) {
          islandCount++;
          checkAround(x, y);
        }
      }
    }
  }
}
