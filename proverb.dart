class Proverb {
  String recite(List<String> pieces) {
    if (pieces.length == 0) {
      return '';
    } else if (pieces.length == 1) {
      return 'And all for the want of a ${pieces[0]}.';
    } else {
      var l1 = pieces.sublist(0, pieces.length - 1);
      var l2 = pieces.sublist(1, pieces.length);
      var zip = List.generate(l1.length, (i) => (l1[i], l2[i]));
      return zip
              .map((e) => 'For want of a ${e.$1} the ${e.$2} was lost.')
              .join('\n') +
          '\n' +
          'And all for the want of a ${pieces[0]}.';
    }
  }
}
