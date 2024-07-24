import 'package:flutter/material.dart';

import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../ui/buttons/primary.dart';
import '../../providers/gender_and_age_provider/display_age_notifier.dart';

class GenderContainer extends StatelessWidget {
  final GenderAndAgeProvider genderAndAgeProvider;

  const GenderContainer({required this.genderAndAgeProvider, super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: genderAndAgeProvider.genderIndexNotifier,
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
                  onPressed: () => genderAndAgeProvider.setGenderIndex(1),
                ),
              ),
              10.sbs,
              Expanded(
                child: MyPrimaryButton(
                  backgroundColor: (genderIndex == 2)
                      ? context.colorScheme.primary
                      : context.colorScheme.primaryContainer.withOpacity(0.2),
                  title: context.translate.women,
                  onPressed: () => genderAndAgeProvider.setGenderIndex(2),
                ),
              )
            ],
          );
        });
  }
}
