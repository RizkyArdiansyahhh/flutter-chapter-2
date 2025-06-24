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
          return User.fromJson(e.id, data);
        }).toList();
        emit(UserValue(dataUser));
      } catch (e) {
        emit(UserError(message: "failde to Fetch Users"));
      }
    });
    on<DeleteUserEvent>((event, emit) async {
      try {
        await users.doc(event.id).delete();
      } catch (e) {
        emit(UserError(message: "Filed to Delete Id ${event.id}"));
      }
    });
    on<EditUserEvent>((event, emit) async {
      try {
        final docSnapshot = await users.doc(event.id).get();
        final data = docSnapshot.data() as Map<String, dynamic>;
        await users.doc(event.id).update({"age": data["age"] + 1});
      } catch (e) {
        emit(UserError(message: "Failed To Edit Id ${event.id}"));
      }
    });
  }

  @override
  void onChange(Change<UserState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
