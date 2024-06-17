import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final bool isMobile;
  const BackgroundImage({
    super.key,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        // width: MediaQuery.of(context).size.width,
        child: isMobile
            ? Image.asset('assets/images/bg-mobile-light.jpg')
            : Image.asset('assets/images/bg-desktop-light.jpg'),
      ),
    );
  }
}
