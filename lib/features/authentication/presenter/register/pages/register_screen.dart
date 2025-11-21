import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/images_string.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/context.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../widgets/appbar/appbar.dart';
import '../../../../../../widgets/dividers/form_divider.dart';
import '../../../../../../widgets/icons/image_circular.dart';
import '../../../../../../widgets/texts/title.dart';
import '../cubit/register_cubit.dart';
import '../widgets/register_form.dart';
import '../widgets/verification_email_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
        context.read(), // AuthenticationRepository
        context.read(), // UserRepository
      ),
      child: Scaffold(
        appBar: const TAppBar(showBackIcon: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                TTitleText(
                  key: const Key('titleText'),
                  context.translate.createAccount,
                ).withPadding(TSizes.spaceBtwSections.bottomPadding),

                /// BlocListener pour gérer succès ou erreur
                BlocListener<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                    } else if (state is RegisterSuccess) {
                      // Naviguer vers VerificationEmailScreen
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => VerificationEmailScreen(
                            email: state.email,
                          ),
                        ),
                      );
                    }
                  },
                  child: const RegisterForm().withPadding(TSizes.spaceBtwSections.bottomPadding),
                ),

                /// Divider
                TFormDivider(
                  key: const Key('dividerLine'),
                  label: context.translate.orSignUpWith,
                ).withPadding(TSizes.spaceBtwSections.bottomPadding),

                /// Footer
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Google
                    TImageCircularIcon(
                      key: const Key('googleIcon'),
                      assetsImagePath: TImages.google,
                      onPressed: () {},
                    ).withPadding(TSizes.spaceBtwItems.rightPadding),

                    /// Facebook
                    TImageCircularIcon(
                      key: const Key('facebookIcon'),
                      assetsImagePath: TImages.facebook,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
