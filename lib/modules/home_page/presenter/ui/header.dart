import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/my_styles.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../ui/indicators/loading_indicator.dart';
import '../../../../ui/my_icons/circle_icon.dart';
import '../extensions/to_gender.dart';
import '../providers/user_info/user_info_cubit.dart';
import '../providers/user_info/user_info_state.dart';
import 'widgets/circular_image_icon.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserinfoCubit()..displayUserInfo(),
      child: BlocConsumer<UserinfoCubit, UserInfoState>(
        listener: (context, state) {
          if (state is LoadUserInfoFailure) {
            var snackBar = SnackBar(content: Text(state.errorMessage), behavior: SnackBarBehavior.floating);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          if (state is UserInfoLoading) {
            return const LoadingIndicator();
          }
          if (state is UserInfoLoaded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularImageIcon(imagePath: state.user.image),
                Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: context.colorScheme.secondary,
                        borderRadius: BorderRadius.circular(MyStyles.buttonRadius)),
                    child: Text(
                      state.user.gender!.toGender(),
                    ).withPadding((h: 36, v: 8).symmetricPadding)),
                MyCircleIcon(onPressed: () {}, iconData: Icons.shopping_basket),
              ],
            );
          }

          return 0.sbs;
        },
      ),
    );
  }
}
