import 'dart:math';

class GenerateOrderId {
  static String generateOrderId(int length) {
    final Random random = Random();
    const int maxDigit = 9;
    String orderId = '';
    for (int i = 0; i < length; i++) {
      orderId += random.nextInt(maxDigit + 1).toString();
    }
    return orderId;
  }
}
