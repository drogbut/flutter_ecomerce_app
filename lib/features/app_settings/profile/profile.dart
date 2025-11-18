import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constants/sizes.dart';
import '../../../core/extensions/widget.dart';
import '../../../widgets/appbar/appbar.dart';
import '../../../widgets/buttons/tertiary.dart';
import '../../../widgets/list_tiles/profile_menu.dart';
import '../../../widgets/texts/section_header.dart';
import '../../../widgets/texts/title.dart';
import '../data/repository/user_repository.dart';
import '../presenter/cubit/user_cubit.dart';
import '../presenter/cubit/user_state.dart';
import 'widgets/profile_picture.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(context.read<UserRepository>())..fetchUserDetails(),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: ${state.errorMessage}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
      appBar: const TAppBar(showBackIcon: true, title: TTitleText('Profile')),

      /// -- body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- profile picture
              const ProfilePicture(),

              /// -- Break
              const Divider().withPadding(TSizes.spaceBtwItems.verticalPadding),

              /// -- Details
              Column(
                children: [
                  const TSectionHeader(title: 'Profile information').withPadding(TSizes.spaceBtwItems.bottomPadding),
                  TProfileMenuTile(title: 'name', subTitle: state.userModel.firstName),
                  TProfileMenuTile(title: 'username', subTitle: state.userModel.lastName),
                ],
              ),

              /// -- Break
              const Divider().withPadding(TSizes.spaceBtwItems.verticalPadding),

              /// -- Personal inform
              Column(
                children: [
                  const TSectionHeader(title: 'Personal information').withPadding(TSizes.spaceBtwItems.bottomPadding),
                  TProfileMenuTile(title: 'UserID', subTitle: state.userModel.id, iconData: Iconsax.copy),
                  TProfileMenuTile(title: 'E-Mail', subTitle: state.userModel.email),
                  TProfileMenuTile(title: 'phone number', subTitle: state.userModel.phoneNumber),
                  const TProfileMenuTile(title: 'Gender', subTitle: 'Male'),
                  const TProfileMenuTile(title: 'Date of Birth', subTitle: '04 Sept. 1990'),
                ],
              ),

              /// -- Break
              const Divider().withPadding(TSizes.spaceBtwItems.verticalPadding),

              /// -- Close Account
              TTertiaryButton(
                title: 'close Account',
                onPressed: () => context.read<UserCubit>().deleteAccountWarningPopup(context),
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
        },
      ),
    );
  }
}
