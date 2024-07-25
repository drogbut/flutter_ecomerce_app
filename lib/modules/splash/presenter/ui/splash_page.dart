import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../authentication/presenter/ui/sign_in.dart';
import '../../domain/app_vectors.dart';
import '../providers/splash_cubit.dart';
import '../providers/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage()));
        }
      },
      child: Scaffold(
        backgroundColor: MyColors.lightPrimary,
        body: Center(
          child: SvgPicture.asset(
            AppVectors.appLogo,
            color: Colors.white,
            height: 200,
          ),
        ),
      ),
    );
  }
}
