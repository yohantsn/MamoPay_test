import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class TransactionModel extends Equatable {
  final double amount;
  final DateTime dateTime;
  final String id;

  TransactionModel({
    required this.amount,
    required this.dateTime,
    String? id,
  }) : id = id ?? const Uuid().v1();

  @override
  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      dateTime: json['dateTime'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() => {
        'dateTime': dateTime,
        'amount': amount,
        'id': id,
      };

  @override
  List<Object?> get props => [
        dateTime,
        amount,
        id,
      ];
}
