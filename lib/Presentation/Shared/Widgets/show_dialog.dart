import 'package:flutter/material.dart';

import '../../../Core/Router/route.dart';

buildDialog({
  required BuildContext context,
  required String content,
  required VoidCallback onButtonPressed,
  required String actionText,
  String? title,
}) async {
  await showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        title: title != null ? Text(title) : null,
        content: Text(content),
        actions: [
          ElevatedButton(
            onPressed: () {
              router.pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: onButtonPressed,
            child: Text(actionText),
          ),
        ],
      );
    },
  );
}
