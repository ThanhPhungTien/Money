import 'package:flutter/material.dart';

class FailureView extends StatelessWidget {
  const FailureView({
    Key? key,
    required this.message,
    this.onPressedRetry,
  }) : super(key: key);

  final String message;
  final VoidCallback? onPressedRetry;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: textTheme.titleSmall,
          ),
          if (onPressedRetry != null) const SizedBox(height: 8),
          if (onPressedRetry != null)
            ElevatedButton(
              onPressed: onPressedRetry,
              child: const Text('Thử lại'),
            )
        ],
      ),
    );
  }
}
