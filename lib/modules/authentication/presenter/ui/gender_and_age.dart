import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
      appBar: const MyAppBarBackButton(hideBack: true),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AgeSelectionCubit()),
          BlocProvider(create: (context) => AgesDisplayCubit()),
        ],
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyTitle(context.translate.tellUsAboutYouSelf).withPadding(40.bottomPadding),
                  Text(context.translate.whoDoYouShopFor).withPadding(10.bottomPadding),
                  GenderContainer(genderAndAgeProvider: _genderAndAgeProvider).withPadding(40.bottomPadding),
                  Text(context.translate.howOldAreYou).withPadding(10.bottomPadding),
                  const AgeRangeButton(),
                ],
              ).withPadding(16.allPadding),
            ),
            ColoredBox(
              color: context.colorScheme.primaryContainer.withOpacity(0.2),
              child: MyPrimaryButton(
                width: context.screenWidth,
                title: context.translate.btnFinish,
                onPressed: () {},
              ).withPadding(16.allPadding),
            ),
          ],
        ),
      ),
    );
  }
}
