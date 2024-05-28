part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class ProfileFetchEvent extends ProfileEvent {
  final int id;
  ProfileFetchEvent({required this.id});
}
