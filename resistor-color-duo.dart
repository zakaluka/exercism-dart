class ResistorColorDuo {
  String getColor(String s) {
    if (s == 'black')
      return '0';
    else if (s == 'brown')
      return '1';
    else if (s == 'red')
      return '2';
    else if (s == 'orange')
      return '3';
    else if (s == 'yellow')
      return '4';
    else if (s == 'green')
      return '5';
    else if (s == 'blue')
      return '6';
    else if (s == 'violet')
      return '7';
    else if (s == 'grey')
      return '8';
    else if (s == 'white')
      return '9';
    else
      throw UnimplementedError();
  }

  int value(List<String> l) {
    var sval = l.take(2).map((el) => getColor(el.toLowerCase())).join();
    return int.parse(sval);
  }
}
