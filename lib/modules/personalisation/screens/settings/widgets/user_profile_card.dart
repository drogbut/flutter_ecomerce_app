import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/images_string.dart';
import '../../../../../widgets/images/circular.dart';
import '../../../../../widgets/texts/title.dart';

class TUserProfileCard extends StatelessWidget {
  const TUserProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(
        width: 50,
        height: 50,
        padding: 0.0,
        imagePath: TImages.user,
      ),
      title: const TTitleText('max Mustermann'),
      subtitle: const Text('max.musterman@gmail.com'),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Iconsax.edit,
            color: TColors.white,
          )),
    );
  }
}
