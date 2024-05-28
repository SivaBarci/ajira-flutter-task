import 'package:ajira_flutter_app/landing/bloc/profile_bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationInfo extends StatelessWidget {
  const LocationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileFetchSuccess) {
          final address =
              "${state.profile.address.suite}, ${state.profile.address.street}, ${state.profile.address.city}.";
          return Text(
            address,
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.right,
          );
        }
        return const Text("");
      },
    );
  }
}
