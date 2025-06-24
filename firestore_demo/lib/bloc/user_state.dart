part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserValue extends UserState {
  final String name;
  final int age;
  const UserValue({required this.name, required this.age});

  @override
  List<Object> get props => [name, age];
}
