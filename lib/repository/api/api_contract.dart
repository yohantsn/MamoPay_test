import 'package:mamopay_test/models/transaction_model.dart';

enum ApiExceptionType {
  others,
}

abstract interface class ApiContract {
  Future<void> addMoney(TransactionModel transaction);
  Future<List<TransactionModel>> get transactions;
}

class ApiException implements Exception {
  ApiException(this.type);
  final ApiExceptionType type;
}
