import 'dart:math';

String generateRandomString() {
  const chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  const length = 10;
  final Random rnd = Random();
  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => chars.codeUnitAt(
        rnd.nextInt(chars.length),
      ),
    ),
  );
}
