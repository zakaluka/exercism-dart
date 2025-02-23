bool isValid(String isbn) {
  var l = isbn.toUpperCase().split('').where((el) => el != '-').take(10);

  if (l.length != 10) return false;

  var x = int.tryParse(l.elementAt(l.length - 1));
  if (x == null && l.elementAt(l.length - 1) != 'X') return false;

  var total = 0;

  for (int i = 0; i < l.length; i++) {
    var y = int.tryParse(l.elementAt(i));

    if (y == null) {
      if (i == l.length - 1 && l.elementAt(i) == 'X') total += (10 - i) * 10;
    } else
      total += (10 - i) * y;
  }

  return total % 11 == 0;
}
