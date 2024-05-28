import 'package:ajira_flutter_app/landing/model/profile_model.dart';
import 'package:ajira_flutter_app/landing/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileFetchEvent>((event, emit) async {
      try {
        final profile = await profileRepo(id: event.id);
        emit(ProfileFetchSuccess(profile: profile));
      } catch (e) {
        emit(ProfileFetchFailure());
      }
    });
  }
}
