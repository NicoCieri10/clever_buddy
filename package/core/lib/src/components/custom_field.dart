import 'package:flutter/material.dart';

/// Custom TextFormField
class CustomField extends StatelessWidget {
  /// Custom TextFormField
  const CustomField({super.key});
  // TODO: Add custom properties

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
