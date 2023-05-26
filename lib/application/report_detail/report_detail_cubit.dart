import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money/enum/transaction_for/transaction_for.dart';
import 'package:money/domain/transaction/transaction_by_name.dart';

part 'report_detail_state.dart';

class ReportDetailCubit extends Cubit<ReportDetailState> {
  ReportDetailCubit()
      : super(ReportDetailInitial(
          const <TransactionByName>[],
          TransactionFor.all,
        ));
  List<TransactionByName> origin = [];
  List<TransactionByName> data = [];
  int filter = TransactionFor.none;

  void initData(List<TransactionByName> data) {
    data.sort((a, b) => b.totalValue.abs().compareTo(a.totalValue.abs()));
    this.data = List.from(data);
    origin = List.from(data);
    emit(ReportDetailInitial(data, filter));
  }

  void changeOpen(int index) {
    data[index] = data[index].copyWith(
      isOpen: !data[index].isOpen,
    );

    emit(ReportDetailInitial(data, filter));
  }

  void applyFilter(int filter) {
    this.filter = filter;
    if (filter == -1) {
      emit(ReportDetailInitial(List.from(origin), filter));
      return;
    }

    List<TransactionByName> listName = origin
        .map((element) => element.copyWith(
              data: element.data.where((item) {
                return item.transactionFor == filter;
              }).toList(),
            ))
        .toList();
    listName.removeWhere((element) => element.data.isEmpty);

    data = listName.map((e) {
      int totalValue = 0;
      for (var element in e.data) {
        totalValue += element.value * element.mode;
      }
      return e.copyWith(totalValue: totalValue);
    }).toList();

    emit(ReportDetailInitial(data, filter));
  }
}
