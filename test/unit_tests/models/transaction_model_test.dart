import 'package:flutter_test/flutter_test.dart';
import 'package:mamopay_test/models/transaction_model.dart';

void main() {
  group('TransactionModel', () {
    final transaction = TransactionModel(amount: 100.00, dateTime: DateTime.now());

    test('toJson generate the correct maps', () {
      expect(transaction.toJson(), {
        'id': transaction.id,
        'amount': 100.00,
        'dateTime': transaction.dateTime,
      });
    });
    test('fromJson generate the correct object', () {
      expect(TransactionModel.fromJson(transaction.toJson()), transaction);
    });

    test('props test', () {
      expect(transaction.props, [
        transaction.dateTime,
        100.00,
        transaction.id,
      ]);
    });
  });
}
