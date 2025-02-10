BigInt square(final int n) {
  if (n <= 0 || n >= 65)
    throw ArgumentError('square must be between 1 and 64');
  else
    return BigInt.from(2).pow(n - 1);
}

BigInt total() {
  return List.generate(64, (i) => i + 1)
      .fold(BigInt.zero, (acc, e) => acc + square(e));
}
