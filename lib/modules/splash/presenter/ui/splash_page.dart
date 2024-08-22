import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/colors.dart';
import '../../../../routing/navigator.dart';
import '../../../authentication/presenter/ui/sign_in.dart';
import '../../../home_page/presenter/ui/home.dart';
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
          AppNavigator.pushReplacement(context, SignInPage());
        }
        if (state is Authenticated) {
          AppNavigator.pushReplacement(context, const HomePage());
        }
      },
      child: Scaffold(
        backgroundColor: DColors.primary,
        body: Center(
          child: SvgPicture.asset(
            AppVectors.appLogo,
            theme: const SvgTheme(
              currentColor: Colors.white,
              xHeight: 200,
              fontSize: 200,
            ),
            //height: 200,
          ),
        ),
      ),
    );
  }
}
