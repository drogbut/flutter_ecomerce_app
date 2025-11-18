import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/extensions/context.dart';
import '../../../../../../widgets/appbar/appbar.dart';
import '../../../../../../widgets/icons/cart_counter.dart';
import '../../../../../app_settings/presenter/cubit/user_cubit.dart';
import '../../../../../app_settings/presenter/cubit/user_state.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return TAppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.translate.homeAppBarTitle,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(color: TColors.grey),
              ),
              // if (state.isProfileLoaded)
              //   const TShimmerEffects(width: 80, height: 15)
              // else
              //   Text(
              //     'User Name', // TODO: Replace with actual user name from state
              //     style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
              //   ),
            ],
          ),
          actions: [
            TCartCounterIcon(
              iconColor: Colors.white,
              //onPressed: () => context.pushNamed(RouteNames.shoppingCart),
              onPressed: () {},
            )
          ],
        );
      },
    );
  }
}
