import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../ui/buttons/primary.dart';
import '../../providers/gender_and_age_provider/gender_selection_cubit.dart';

class GenderContainer extends StatelessWidget {
  const GenderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: MyPrimaryButton(
                backgroundColor:
                    (state == 1) ? context.colorScheme.primary : context.colorScheme.primaryContainer.withOpacity(0.2),
                title: context.translate.men,
                onPressed: () => context.read<GenderSelectionCubit>().selectGender(1),
              ),
            ),
            10.sbs,
            Expanded(
              child: MyPrimaryButton(
                backgroundColor:
                    (state == 2) ? context.colorScheme.primary : context.colorScheme.primaryContainer.withOpacity(0.2),
                title: context.translate.women,
                onPressed: () => context.read<GenderSelectionCubit>().selectGender(2),
              ),
            )
          ],
        );
      },
    );
  }
}
