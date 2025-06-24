import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firestore_demo/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final CollectionReference users = FirebaseFirestore.instance.collection(
    "users",
  );
  UserBloc() : super(UserInitial()) {
    on<AddUserEvent>((event, emit) async {
      // TODO: implement event handler
      emit(UserLoading());
      try {
        final User user = User(name: event.name, age: event.age);
        await users.add(user.toJson());
      } catch (e) {
        emit(UserError(message: "Failed to add user"));
      }
    });
    on<FetchUserEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final snapshot = await users.get();
        List<User> dataUser = snapshot.docs.map((e) {
          final data = e.data() as Map<String, dynamic>;
          return User.fromJson(data);
        }).toList();
        emit(UserValue(dataUser));
      } catch (e) {
        emit(UserError(message: "failde to Fetch Users"));
      }
    });
  }
}
