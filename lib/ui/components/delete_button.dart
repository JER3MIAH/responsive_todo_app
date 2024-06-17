import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DeleteButton extends StatelessWidget {
  final void Function()? onTap;
  const DeleteButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: SvgPicture.asset(
          'assets/images/icon-cross.svg',
        ),
      ),
    );
  }
}
