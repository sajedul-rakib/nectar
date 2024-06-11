import 'dart:math';

class GenerateOrderId {
  String generateOrderId() {
    final now = DateTime.now();
    final randomNumber = Random().nextInt(100000);

    return "${now.microsecondsSinceEpoch}${randomNumber.toString().padLeft(6, '0')}";
  }
}
