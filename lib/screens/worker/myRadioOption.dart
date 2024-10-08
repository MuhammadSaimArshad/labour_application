import 'package:flutter/material.dart';

class MyRadioOption<T> extends StatelessWidget {
  final T value;
  final T? groupValue;

  final String text;
  final ValueChanged<T?> onChanged;

  const MyRadioOption({
    required this.value,
    required this.groupValue,
    required this.text,
    required this.onChanged,
  });

  Widget _buildLabel() {
    final bool isSelected = value == groupValue;

    return Container(
      width: 20,
      decoration: ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(
            color: Colors.orange,
          ),
        ),
        color: isSelected ? Colors.white : Colors.black,
      ),
    );
  }

  Widget _buildText() {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () => onChanged(value),
        splashColor: Colors.cyan.withOpacity(0.5),
        child: Row(
          children: [
            _buildLabel(),
            const SizedBox(width: 8),
            _buildText(),
          ],
        ),
      ),
    );
  }
}
