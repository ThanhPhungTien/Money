part of 'report_detail_cubit.dart';

@immutable
abstract class ReportDetailState {}

class ReportDetailInitial extends ReportDetailState {
  final List<TransactionByName> data;

  ReportDetailInitial(this.data);
}
