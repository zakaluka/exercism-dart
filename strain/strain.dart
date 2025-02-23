class Strain {
  List keep(List l, Function f) {
    var x = [];

    for (var el in l) if (f(el)) x.add(el);

    return x;
  }

  List discard(List l, Function f) {
    var x = [];

    for (var el in l) if (!f(el)) x.add(el);

    return x;
  }
}
