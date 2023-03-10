part of 'report_detail_cubit.dart';

@immutable
abstract class ReportDetailState {}

class ReportDetailInitial extends ReportDetailState {
  final List<TransactionByName> data;
  final int filter;

  ReportDetailInitial(this.data, this.filter);
}
