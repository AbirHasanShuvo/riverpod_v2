import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v2/models/user_models.dart';
import 'package:riverpod_v2/services/services.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});
