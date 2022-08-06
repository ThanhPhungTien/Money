import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money/model/transaction_by_name/transaction_by_name.dart';

part 'report_detail_state.dart';

class ReportDetailCubit extends Cubit<ReportDetailState> {
  ReportDetailCubit() : super(ReportDetailInitial(const <TransactionByName>[]));

  void initData(List<TransactionByName> data) {
    data.sort((a,b)=> b.totalValue.abs().compareTo(a.totalValue.abs()));
    emit(ReportDetailInitial(data));
  }

  void changeOpen(int index, List<TransactionByName> data) {
    data[index] = data[index].copyWith(
      isOpen: !data[index].isOpen,
    );

    emit(ReportDetailInitial(data));
  }
}
