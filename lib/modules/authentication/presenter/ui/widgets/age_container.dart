import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/gender_and_age_provider/age_selection_cubit.dart';

class AgeContainer extends StatelessWidget {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> ages;

  const AgeContainer({
    required this.ages,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
              context.read<AgeSelectionCubit>().selectAge(
                    ages[index].data()['value'],
                  );
            },
            child: Text(
              ages[index].data()['value'],
              style: const TextStyle(fontSize: 18),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
        itemCount: ages.length);
  }
}
