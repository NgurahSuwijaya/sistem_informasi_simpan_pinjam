import 'package:flutter/cupertino.dart';

class AppOkeDialog extends StatelessWidget {
  final String title;
  final String? buttonText;
  final String content;
  final VoidCallback? onPressed;

  const AppOkeDialog({
    Key? key,
    required this.title,
    required this.content,
    this.buttonText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: onPressed,
          child: buttonText == null ? const Text('Oke') : Text(buttonText!),
        ),
      ],
    );
  }
}
