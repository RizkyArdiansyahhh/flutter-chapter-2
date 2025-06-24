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

class DeleteUserEvent extends UserEvent {
  final String id;

  const DeleteUserEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class FetchUserEvent extends UserEvent {}

class EditUserEvent extends UserEvent {
  final String id;

  const EditUserEvent({required this.id});

  @override
  List<Object> get props => [id];
}
