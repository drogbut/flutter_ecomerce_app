import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../extensions/to_gender.dart';
import '../../../../ui/indicators/loading_indicator.dart';
import '../providers/user_info_cubit.dart';
import '../providers/user_info_state.dart';
import 'widgets/circular_image_icon.dart';
import '../../../../ui/my_icons/circle_icon.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserinfoCubit()..displayUserInfo(),
      child: BlocConsumer<UserinfoCubit, UserInfoState>(
        listener: (context, state) {
              if (state is LoadUserInfoFailure) {
                var snackBar = SnackBar(
                    content: Text(state.errorMessage),
                    behavior: SnackBarBehavior.floating);
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
                              borderRadius: BorderRadius.circular(20)
                            ),
                        child: Text(state.user.gender!.toGender(),).withPadding((h:36, v:8).symmetricPadding)
                        ),
                      
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
