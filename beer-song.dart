class BeerSong {
  String partOne(int num) {
    var s = 'bottles of beer on the wall, ';
    if (num == 0)
      return 'No more ' + s;
    else if (num == 1)
      return '1 bottle of beer on the wall, ';
    else
      return num.toString() + ' ' + s;
  }

  String partTwo(int num) {
    var s = 'bottles of beer.';
    if (num == 0)
      return 'no more ' + s;
    else if (num == 1)
      return '1 bottle of beer.';
    else
      return num.toString() + ' ' + s;
  }

  String partThree(int left) {
    if (left == -1)
      return 'Go to the store and buy some more, ';
    else if (left == 0)
      return 'Take it down and pass it around, ';
    else
      return 'Take one down and pass it around, ';
  }

  String partFour(int left) {
    if (left == -1)
      return '99 bottles of beer on the wall.';
    else if (left == 0)
      return 'no more bottles of beer on the wall.';
    else if (left == 1)
      return '1 bottle of beer on the wall.';
    else
      return left.toString() + ' bottles of beer on the wall.';
  }

  List<String> recite(int start, int count) {
    var s = <String>[];
    for (int i = 0; i < count; i++) {
      s.add(partOne(start - i) + partTwo(start - i));
      s.add(partThree(start - 1 - i) + partFour(start - 1 - i));

      // Empty line
      s.add('');
    }

    return s.take(s.length - 1).toList();
  }
}
