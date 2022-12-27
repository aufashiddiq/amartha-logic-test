class FindPathUtils {
  List<List<int>> blocks;

  FindPathUtils(this.blocks);

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

  bool checkPath({int x = 0, int y = 0}) {
    if (checkAroundIsSafe(x, y) && blocks[x][y] == 0 && !checked[x][y]) {
      checked[x][y] = true;

      if (x == blocks.length - 1 && y == blocks[0].length - 1) {
        hasPath = true;
        return true;
      }

      if (checkPath(x: x - 1, y: y)) return true;
      if (checkPath(x: x, y: y - 1)) return true;
      if (checkPath(x: x + 1, y: y)) return true;
      if (checkPath(x: x, y: y + 1)) return true;
    }
    return false;
  }
}
