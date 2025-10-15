import 'package:flutter/material.dart';

class ErrorStateWidget extends StatelessWidget {
  final String errorMessage;
  const ErrorStateWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Center(
            child: Text(
              errorMessage,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
