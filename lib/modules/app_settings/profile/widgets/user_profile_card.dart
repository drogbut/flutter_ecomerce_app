import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images_string.dart';
import '../../../../widgets/images/circular.dart';
import '../../../../widgets/texts/title.dart';
import '../../controllers/user_controller.dart';
import '../profile.dart';

class TUserProfileCard extends StatelessWidget {
  const TUserProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return ListTile(
      leading: const TCircularImage(
        backgroundColor: Colors.transparent,
        width: 50,
        height: 50,
        padding: 0.0,
        imagePath: TImages.user,
      ),
      title: TTitleText(controller.userModel.value.fullName),
      subtitle: Text(controller.userModel.value.email),
      trailing: IconButton(
        icon: const Icon(Iconsax.edit, color: TColors.white),
        onPressed: () => Get.to(const TProfilePage()),
      ),
    );
  }
}
