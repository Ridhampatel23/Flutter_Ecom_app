import 'package:flutter/material.dart';

class ecomSectionHeading extends StatelessWidget {
  const ecomSectionHeading({
    super.key, required this.title,  this.buttonTitle = 'View all', this.textColor,  this.showActionButton = true, this.onPressed,
  });

  final String title, buttonTitle;
  final Color? textColor;
  final bool showActionButton;
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text( title,
            style:
            Theme.of(context).textTheme.headlineSmall!.apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        if(showActionButton) TextButton(onPressed: onPressed, child:  Text(buttonTitle))
      ],
    );
  }
}
