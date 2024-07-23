import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folders_structure/core/constants/my_styles.dart';
import 'package:flutter_folders_structure/core/extensions/context.dart';
import 'package:flutter_folders_structure/core/extensions/widget.dart';
import 'package:flutter_folders_structure/core/utilities/dialog.dart';
import 'package:flutter_folders_structure/modules/authentication/presenter/provider/gender_selected_provider.dart';
import 'package:flutter_folders_structure/ui/buttons/primary.dart';
import 'package:flutter_folders_structure/ui/text/title_text.dart';

import '../../../../ui/my_appbar/platform_back_button.dart';

class GenderAndAgePage extends StatefulWidget {
  const GenderAndAgePage({super.key});

  @override
  State<GenderAndAgePage> createState() => _GenderAndAgePageState();
}

class _GenderAndAgePageState extends State<GenderAndAgePage> {
  final GenderSelectedProvider _genderSelectedProvider = GenderSelectedProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarBackButton(hideBack: true),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            MyTitle(context.translate.tellUsAboutYouSelf),
            MyStyles.largeSpacingBetweenField.sbs,
            Text(context.translate.whoDoYouShopFor),
            MyStyles.mediumSpacingBetweenField.sbs,
            ValueListenableBuilder(
                valueListenable: _genderSelectedProvider.genderIndexNotifier,
                builder: (_, genderIndex, __) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: MyPrimaryButton(
                          backgroundColor: (genderIndex == 1)
                              ? context.colorScheme.primary
                              : context.colorScheme.primaryContainer.withOpacity(0.2),
                          title: context.translate.men,
                          onPressed: () => _genderSelectedProvider.setGenderIndex(1),
                        ),
                      ),
                      10.sbs,
                      Expanded(
                        child: MyPrimaryButton(
                          backgroundColor: (genderIndex == 2)
                              ? context.colorScheme.primary
                              : context.colorScheme.primaryContainer.withOpacity(0.2),
                          title: context.translate.women,
                          onPressed: () => _genderSelectedProvider.setGenderIndex(2),
                        ),
                      )
                    ],
                  );
                }),
            MyStyles.largeSpacingBetweenField.sbs,
            Text(context.translate.howOldAreYou),
            MyStyles.smallSpacingBetweenField.sbs,
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(MyStyles.xLargeBorderRadius),
                side: BorderSide(color: context.colorScheme.primary),
              ),
              leading: Text(context.translate.ageRange),
              trailing: const Icon(CupertinoIcons.chevron_down),
              onTap: () => _displaySelectedGenderDialog(),
            ),
            MyStyles.smallSpacingBetweenField.sbs,
            Expanded(child: 0.sbs),
            MyPrimaryButton(
              width: context.screenWidth,
              title: context.translate.btnFinish,
              onPressed: () {},
            )
          ],
        ).withPadding((h: 16, v: 10).symmetricPadding),
      ),
    );
  }

  Future<void> _displaySelectedGenderDialog() async {
    return await myBottomSheet(
      context,
      Container(),
    );
  }
}
