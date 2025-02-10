class Foo<T extends Object> {
  T tee(T x) {
    print(x);
    return x;
  }
}

class WordCount {
  var x = Foo();

  Map<String, int> countWords(String s) {
    Map<String, int> ret = {};

    s
        .toLowerCase()
        .replaceAll(RegExp(r'\s'), ' ')
        .replaceAll(RegExp('[^\'a-z0-9]'), ' ')
        .split(' ')
        .map((el) => el.replaceAll('\'\'', '\''))
        .where((el) => el.contains(RegExp('[a-z0-9]')))
        .where((el) => el != '')
        .map((el) {
      var x = el;

      if (x.startsWith('\'')) {
        x = x.substring(x.indexOf(RegExp(r'[a-z0-9]')));
      }

      if (x.endsWith('\'')) {
        x = x.substring(0, x.length - 1);
      }

      return x;
    }).forEach((el) => ret[el] = (ret[el] ?? 0) + 1);

    return ret;
  }
}
