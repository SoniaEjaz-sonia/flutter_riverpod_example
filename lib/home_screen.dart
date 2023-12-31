import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_model.dart';
import 'user_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: data.users.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {},
                      child: Card(
                        color: Colors.blue,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(
                            data.users[index].firstname,
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(data.users[index].lastname, style: const TextStyle(color: Colors.white)),
                          trailing: CircleAvatar(
                            backgroundImage: NetworkImage(data.users[index].avatar),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        // data.when(
        //   data: (data) {
        //     List<UserModel> userList = data.map((e) => e).toList();
        //     return Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 10),
        //       child: Column(
        //         children: [
        //           Expanded(
        //             child: ListView.builder(
        //               itemCount: userList.length,
        //               itemBuilder: (_, index) {
        //                 return InkWell(
        //                   onTap: () {},
        //                   child: Card(
        //                     color: Colors.blue,
        //                     elevation: 4,
        //                     margin: const EdgeInsets.symmetric(vertical: 10),
        //                     child: ListTile(
        //                       title: Text(
        //                         userList[index].firstname,
        //                         style: const TextStyle(color: Colors.white),
        //                       ),
        //                       subtitle: Text(userList[index].lastname, style: const TextStyle(color: Colors.white)),
        //                       trailing: CircleAvatar(
        //                         backgroundImage: NetworkImage(userList[index].avatar),
        //                       ),
        //                     ),
        //                   ),
        //                 );
        //               },
        //             ),
        //           ),
        //         ],
        //       ),
        //     );
        //   },
        //   error: (err, s) => Text(err.toString()),
        //   loading: () => const Center(
        //     child: CircularProgressIndicator(),
        //   ),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: data.users.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      color: Colors.blue,
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          data.users[index].firstname,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(data.users[index].lastname, style: const TextStyle(color: Colors.white)),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(data.users[index].avatar),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // data.when(
      //     data: (data) {
      //       List<UserModel> userList = data.map((e) => e).toList();
      //       return Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 10),
      //         child: Column(
      //           children: [
      //             Expanded(
      //                 child: ListView.builder(
      //                     itemCount: userList.length,
      //                     itemBuilder: (_, index) {
      //                       return InkWell(
      //                         onTap: () {},
      //                         child: Card(
      //                           color: Colors.blue,
      //                           elevation: 4,
      //                           margin: const EdgeInsets.symmetric(vertical: 10),
      //                           child: ListTile(
      //                             title: Text(
      //                               userList[index].firstname,
      //                               style: const TextStyle(color: Colors.white),
      //                             ),
      //                             subtitle: Text(userList[index].lastname, style: const TextStyle(color: Colors.white)),
      //                             trailing: CircleAvatar(
      //                               backgroundImage: NetworkImage(userList[index].avatar),
      //                             ),
      //                           ),
      //                         ),
      //                       );
      //                     }))
      //           ],
      //         ),
      //       );
      //     },
      //     error: (err, s) => Text(err.toString()),
      //     loading: () => const Center(
      //           child: CircularProgressIndicator(),
      //         )),
    );
  }
}
