part of 'report_cubit.dart';

@immutable
abstract class ReportState {}

class ReportInitial extends ReportState {}

class ReportStateGotData extends ReportState {
  final DateTime time;
  final int total;
  final int remain;
  final int totalEarn;
  final int totalPaid;
  final int maxPaid;
  final List<TransactionByName>  paidList;
  final List<TransactionByName> earnList;
  final List<TransactionByDate> paidDateList;
  final List<TransactionByDate> earnDateList;

  ReportStateGotData(
    this.time,
    this.total,
    this.totalEarn,
    this.totalPaid,
    this.paidList,
    this.earnList,
    this.remain,
    this.maxPaid,
    this.paidDateList,
    this.earnDateList,
  );
}
