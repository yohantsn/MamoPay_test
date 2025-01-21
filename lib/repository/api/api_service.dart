import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mamopay_test/models/transaction_model.dart';
import 'package:mamopay_test/repository/api/collections.dart';
import 'package:mamopay_test/repository/auth/auth_contract.dart';
import 'package:mamopay_test/repository/repository.dart';

class ApiService implements ApiContract {
  ApiService({
    FirebaseFirestore? firebaseInstance,
    required this.authContract,
  }) : _firebaseFirestore = firebaseInstance ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firebaseFirestore;
  final AuthContract authContract;

  String get _uid => authContract.uid ?? '';

  @override
  Future<void> addMoney(TransactionModel transaction) async {
    try {
      await _firebaseFirestore
          .doc(_uid)
          .collection(Collections.transactionPath)
          .doc(transaction.id)
          .set(transaction.toJson());
    } catch (e) {
      throw ApiException(ApiExceptionType.others);
    }
  }

  @override
  Future<List<TransactionModel>> get transactions async {
    final transtions = <TransactionModel>[];

    final snapshot = await _firebaseFirestore.doc(_uid).collection(Collections.transactionPath).get();
    for (final doc in snapshot.docs) {
      if (doc.exists) {
        transtions.add(TransactionModel.fromJson(doc.data()));
      }
    }

    return transtions;
  }
}
