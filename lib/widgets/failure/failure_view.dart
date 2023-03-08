import 'package:flutter/material.dart';

class FailureView extends StatelessWidget {
  const FailureView({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Center(child: Text(message, style: textTheme.titleSmall));
  }
}
