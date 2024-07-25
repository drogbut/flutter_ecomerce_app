import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/my_styles.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../ui/buttons/primary.dart';
import '../../../../ui/my_appbar/platform_back_button.dart';
import '../../../../ui/text/title_text.dart';
import '../providers/gender_and_age_provider/age_selection_cubit.dart';
import '../providers/gender_and_age_provider/display_age_cubit.dart';
import '../providers/gender_and_age_provider/display_age_notifier.dart';
import 'widgets/age_range_button.dart';
import 'widgets/gender_container.dart';

class GenderAndAgePage extends StatefulWidget {
  const GenderAndAgePage({super.key});

  @override
  State<GenderAndAgePage> createState() => _GenderAndAgePageState();
}

class _GenderAndAgePageState extends State<GenderAndAgePage> {
  final GenderAndAgeProvider _genderAndAgeProvider = GenderAndAgeProvider();

  @override
  Widget build(BuildContext context) {
    final spacerBox = MyStyles.largeSpacingBetweenField.sbs;

    return Scaffold(
      appBar: const MyAppBarBackButton(hideBack: true),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AgeSelectionCubit()),
          BlocProvider(create: (context) => AgesDisplayCubit()),
        ],
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              MyTitle(context.translate.tellUsAboutYouSelf),
              spacerBox,
              Text(context.translate.whoDoYouShopFor),
              spacerBox,
              GenderContainer(genderAndAgeProvider: _genderAndAgeProvider),
              spacerBox,
              Text(context.translate.howOldAreYou),
              spacerBox,
              const AgeRangeButton(),
              spacerBox,
              const Spacer(),
              MyPrimaryButton(
                width: context.screenWidth,
                title: context.translate.btnFinish,
                onPressed: () {},
              )
            ],
          ).withPadding((h: 16, v: 10).symmetricPadding),
        ),
      ),
    );
  }
}
