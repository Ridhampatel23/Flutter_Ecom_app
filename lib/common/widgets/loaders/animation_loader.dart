import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// A widget for displaying an animated loading indicator with optional text and action button

class ecomAnimationLoaderWidget extends StatelessWidget {
  ///Default constructor
  ///
  /// Parameters:
  /// - text: The text to be displayed below the animation.
  /// - animation: The path to the Lattice Animation file
  /// - showAction: Whether to show an action button below the text
  /// - actionText: The text to be displayed on the action button.
  /// - onActionPressed: Callback function to be executed when the button is pressed.
  const ecomAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onActionPressed});

  final String text, animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width *
                  0.8), // Displays the animation
          const SizedBox(height: ecomSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: ecomSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: ecomColors.light),
                    ),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: ecomColors.dark),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}