part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class AddUserEvent extends UserEvent {
  final String name;
  final int age;

  const AddUserEvent({required this.name, required this.age});

  @override
  List<Object> get props => [name, age];
}

class DeleteUserEvent extends UserEvent {}

class FetchUserEvent extends UserEvent {}
