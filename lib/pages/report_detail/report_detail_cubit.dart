import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money/model/transaction_by_name/transaction_by_name.dart';

part 'report_detail_state.dart';

class ReportDetailCubit extends Cubit<ReportDetailState> {
  ReportDetailCubit() : super(ReportDetailInitial(const <TransactionByName>[]));
  List<TransactionByName> data = [];

  void initData(List<TransactionByName> data) {
    data.sort((a, b) => b.totalValue.abs().compareTo(a.totalValue.abs()));
    this.data = data;
    emit(ReportDetailInitial(data));
  }

  void changeOpen(int index) {
    data[index] = data[index].copyWith(
      isOpen: !data[index].isOpen,
    );

    emit(ReportDetailInitial(data));
  }

  void applyFilter(int filter) {
    log('filter $filter');
    emit(
      ReportDetailInitial(
        data
            .map((element) => element.copyWith(
                  data: element.data
                      .where((item) {
                        log('item ${item.transactionFor == filter}');
                        return item.transactionFor == filter;
                      })
                      .toList(),
                ))
            .toList(),
      ),


    );
  }
}
