import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_service.dart';
import 'user_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      body: data.when(
          data: (data) {
            List<UserModel> userList = data.map((e) => e).toList();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {},
                              child: Card(
                                color: Colors.blue,
                                elevation: 4,
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  title: Text(
                                    userList[index].firstname,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(userList[index].lastname, style: const TextStyle(color: Colors.white)),
                                  trailing: CircleAvatar(
                                    backgroundImage: NetworkImage(userList[index].avatar),
                                  ),
                                ),
                              ),
                            );
                          }))
                ],
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
