import 'package:flutter/material.dart';
import 'package:money/tool/tool.dart';

class MoneyKeyBoardWidget extends StatelessWidget {
  const MoneyKeyBoardWidget({
    Key? key,
    required this.tec,
  }) : super(key: key);

  final TextEditingController tec;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(height: 1),
        Row(
          children: [
            ClearKeyBoardButton(onTap: () => tec.clear()),
            Expanded(
              flex: 2,
              child: Center(child: Text(moneyTextFormat(tec.text))),
            ),
            BackKeyBoardButton(onTap: () => _backspace()),
          ],
        ),
        Row(
          children: [
            KeyBoardButton(label: '7', onTap: () => _insertText('7')),
            KeyBoardButton(label: '8', onTap: () => _insertText('8')),
            KeyBoardButton(label: '9', onTap: () => _insertText('9')),
            KeyBoardButton(label: '000', onTap: () => _insertText('000')),
          ],
        ),
        Row(
          children: [
            KeyBoardButton(label: '4', onTap: () => _insertText('4')),
            KeyBoardButton(label: '5', onTap: () => _insertText('5')),
            KeyBoardButton(label: '6', onTap: () => _insertText('6')),
            KeyBoardButton(label: '0', onTap: () => _insertText('0')),
          ],
        ),
        Row(
          children: [
            KeyBoardButton(label: '1', onTap: () => _insertText('1')),
            KeyBoardButton(label: '2', onTap: () => _insertText('2')),
            KeyBoardButton(label: '3', onTap: () => _insertText('3')),
            KeyBoardButton(
              label: 'XONG',
              backgroundColor: Colors.green,
              labelColor: Colors.white,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    );
  }

  void _insertText(String myText) {
    final text = tec.text;
    final textSelection = tec.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    tec.text = newText;
    tec.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void _backspace() {
    final text = tec.text;
    final textSelection = tec.selection;
    final selectionLength = textSelection.end - textSelection.start;

    // There is a selection.
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      tec.text = newText;
      tec.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    }

    // The cursor is at the beginning.
    if (textSelection.start == 0) {
      return;
    }

    // Delete the previous character
    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    tec.text = newText;
    tec.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }
}

class BackKeyBoardButton extends StatelessWidget {
  const BackKeyBoardButton({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: onTap,
            child: const Center(
              child: Icon(Icons.backspace, color: Colors.green),
            ),
          ),
        ),
      ),
    );
  }
}

class ClearKeyBoardButton extends StatelessWidget {
  const ClearKeyBoardButton({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 48,
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: Text(
                'C',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.green,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class KeyBoardButton extends StatelessWidget {
  const KeyBoardButton({
    Key? key,
    required this.label,
    this.backgroundColor = Colors.white,
    this.labelColor = Colors.green,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final Color backgroundColor;
  final Color labelColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 54,
        child: Material(
          color: backgroundColor,
          child: InkWell(
            splashColor: Colors.green,
            onTap: onTap,
            child: Center(
              child: Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: labelColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
