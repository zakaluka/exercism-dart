class PascalsTriangle {
  List<List<int>> rows(int n) {
    List<List<int>> t = [];

    for (int i = 0; i < n; i++) {
      var row = <int>[];
      for (int k = 0; k <= i; k++) {
        row.add(Comb(i, k));
      }
      t.add(row);
    }

    return t;
  }

  int Comb(int n, int k) {
    if (k == 0 || k == n) return 1;
    return Comb(n - 1, k - 1) + Comb(n - 1, k);
  }
}
