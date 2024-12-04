import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget(
      {super.key, required this.content, required this.onTap});

  final String content;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Alert'),
      content: Text(content),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: onTap,
          child: const Text('OK'),
        ),
      ],
    );
  }
}
