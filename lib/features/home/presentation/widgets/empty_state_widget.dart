import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: const [
        SizedBox(height: 250),
        Center(
          child: Text(
            "No products available.\nPull down to refresh.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
