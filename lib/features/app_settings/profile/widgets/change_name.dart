import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../routing/route_names.dart';
import '../../../../utilities/validators/validator.dart';
import '../../../../widgets/appbar/appbar.dart';
import '../../../../widgets/buttons/primary.dart';
import '../../../../widgets/fields/primary.dart';
import '../../../../widgets/texts/title.dart';
import '../../../app_settings/data/repository/user_repository.dart';
import '../../../app_settings/presenter/cubit/update_name_cubit.dart';
import '../../../app_settings/presenter/cubit/update_name_state.dart';
class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateNameCubit(context.read<UserRepository>())..initializeNames(),
      child: BlocConsumer<UpdateNameCubit, UpdateNameState>(
        listener: (context, state) {
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Congratulations! Your name has been updated.'),
                backgroundColor: Colors.green,
              ),
            );
            context.goNamed(RouteNames.profile);
          }
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
          final cubit = context.read<UpdateNameCubit>();
          return Scaffold(
            appBar: const TAppBar(
              showBackIcon: true,
              title: TTitleText('Profile'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// -- Header
                    Text(
                      'User real name for easy verification. this name will appear on several pages.',
                      style: Theme.of(context).textTheme.labelSmall,
                    ).withPadding(TSizes.spaceBtwSections.bottomPadding),

                    /// -- Form
                    Form(
                      key: cubit.updateNameFormKey,
                      child: Column(
                        children: [
                          /// E-mail
                          TPrimaryTextField(
                            controller: cubit.firstName,
                            validator: (value) => TValidator.emptyText(context, 'First name', value),
                            prefixIcon: Iconsax.user,
                            label: context.translate.firstname,
                          ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

                          /// E-mail
                          TPrimaryTextField(
                            controller: cubit.lastName,
                            validator: (value) => TValidator.emptyText(context, 'Last name', value),
                            prefixIcon: Iconsax.user,
                            label: context.translate.lastname,
                          ),
                        ],
                      ),
                    ).withPadding(TSizes.spaceBtwSections.bottomPadding),

                    /// -- Close Account
                    TPrimaryButton(
                      title: 'Save',
                      onPressed: state.isLoading ? null : () => cubit.updateUserName(),
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
