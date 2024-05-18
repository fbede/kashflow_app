class Either<A, B> {
  final A? _a;
  final B? _b;

  Either.a(this._a) : _b = null;
  Either.b(this._b) : _a = null;

  R when<R>({required R Function(A a) a, required R Function(B b) b}) {
    if (_a != null) {
      return a.call(_a as A);
    }

    if (_b != null) {
      return b.call(_b as B);
    }

    throw UnsupportedError("'A' and 'B' cannot be null at the same time");
  }
}
