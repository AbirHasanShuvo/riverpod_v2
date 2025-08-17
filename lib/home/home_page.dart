import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v2/data_provider/data_provider.dart';
import 'package:riverpod_v2/models/user_models.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Riverpod')),
      body: _data.when(
        data: (_data) {
          List<UserModel> userlist = _data.map((e) => e).toList();
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: userlist.length,
                  itemBuilder: (_, index) {
                    return Card(
                      color: Colors.blue,
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          userlist[index].firstname,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          userlist[index].lastname,
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(userlist[index].avatar),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => Center(child: const CircularProgressIndicator()),
      ),
    );
  }
}
