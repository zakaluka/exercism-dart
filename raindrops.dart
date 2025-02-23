class Raindrops {
  String convert(int n) {
    var x = '';

    if (n % 3 == 0) x += 'Pling';
    if (n % 5 == 0) x += 'Plang';
    if (n % 7 == 0) x += 'Plong';

    return x == '' ? n.toString() : x;
  }
}
