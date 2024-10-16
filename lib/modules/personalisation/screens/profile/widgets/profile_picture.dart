import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/images_string.dart';
import '../../../../../widgets/buttons/tertiary.dart';
import '../../../../../widgets/images/circular.dart';
import '../../../../../widgets/loaders/shimmer_effects.dart';
import '../../../controllers/user_controller.dart';

class ProfilePicture extends StatelessWidget {
  final UserController controller;

  const ProfilePicture({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () {
            final networkImage = controller.userModel.value.profilePicture;
            final image = networkImage.isNotEmpty ? networkImage : TImages.user;

            return InkWell(
              onTap: () => controller.uploadUserprofileImage(),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: controller.isProfileLoaded.value
                    ? const TShimmerEffects(width: 80, height: 80, radius: 80)
                    : TCircularImage(
                        backgroundColor: Colors.transparent,
                        width: 80,
                        height: 80,
                        image: image,
                        isNetworkImage: networkImage.isNotEmpty,
                      ),
              ),
            );
          },
        ),
        TTertiaryButton(
          title: 'change profile picture',
          onPressed: () => controller.uploadUserprofileImage(),
        ),
      ],
    );
  }
}
