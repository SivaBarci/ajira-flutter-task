part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileFetchSuccess extends ProfileState {
  final ProfileModel profile;
  ProfileFetchSuccess({required this.profile});
}

final class ProfileFetchFailure extends ProfileState {}
