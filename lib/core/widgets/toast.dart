import 'package:flutter/material.dart';

toast({required BuildContext context, required String message, required Color backgroundColor, required TextStyle textStyle, }) {
  SnackBar snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(
      message,
      style: textStyle,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    ),
    backgroundColor: backgroundColor,
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.all(25),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}