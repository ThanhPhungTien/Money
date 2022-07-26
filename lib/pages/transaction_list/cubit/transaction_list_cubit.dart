import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:money/enum/constant.dart';

part 'transaction_list_state.dart';

class TransactionListCubit extends Cubit<TransactionListState> {
  TransactionListCubit() : super(TransactionListInitial());

  CollectionReference transactionCR =
      FirebaseFirestore.instance.collection(Constant.transaction);
}
