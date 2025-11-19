import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/buttons/tertiary.dart';
import '../../../../widgets/images/circular.dart';
import '../../../../widgets/loaders/shimmer_effects.dart';
import '../../../app_settings/presenter/cubit/user_cubit.dart';
import '../../../app_settings/presenter/cubit/user_state.dart';
class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Column(
          children: [
            InkWell(
              onTap: () => context.read<UserCubit>().uploadUserprofileImage(),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: state.isProfileLoaded
                    ? const TShimmerEffects(width: 80, height: 80, radius: 80)
                    : TCircularImage(
                        backgroundColor: Colors.transparent,
                        width: 80,
                        height: 80,
                        imagePath: 'image',
                        isNetworkImage: true,
                      ),
              ),
            ),
            TTertiaryButton(
              title: 'change profile picture',
              onPressed: () => context.read<UserCubit>().uploadUserprofileImage(),
            ),
          ],
        );
      },
    );
  }
}
