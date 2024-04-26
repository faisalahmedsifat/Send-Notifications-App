import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(
      {super.key, required this.title, required this.onChanged});

  final String title;

  final ValueChanged<String> onChanged;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: _obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: widget.title,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
