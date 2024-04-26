import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  EmailField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
        ),
        onChanged: onChanged,
      ),
    );
  }
}
