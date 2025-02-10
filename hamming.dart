class Hamming {
  var error = ArgumentError('strands must be of equal length');

  int distance(String a, String b) {
    int dist = 0;
    a = a.toUpperCase();
    b = b.toUpperCase();

    if (a.length != b.length) throw error;

    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) dist++;
    }

    return dist;
  }
}
