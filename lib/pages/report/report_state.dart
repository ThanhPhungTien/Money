part of 'report_cubit.dart';

@immutable
abstract class ReportState {}

class ReportInitial extends ReportState {}

class ReportStateGotData extends ReportState {
  final DateTime time;
  final int total;
  final int totalEarn;
  final int totalPaid;

  ReportStateGotData(this.time, this.total, this.totalEarn, this.totalPaid);
}