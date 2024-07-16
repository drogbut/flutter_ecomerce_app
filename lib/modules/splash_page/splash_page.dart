import 'package:flutter/material.dart';
import 'package:flutter_folders_structure/modules/splash_page/app_vectors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/my_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: Center(
        child: SvgPicture.asset(
          AppVectors.appLogo,
          color: Colors.white,
          height: 200,
        ),
      ),
    );
  }
}
