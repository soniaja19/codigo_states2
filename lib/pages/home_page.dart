import 'package:codigo_states2/pages/provider/post_provider.dart';
import 'package:codigo_states2/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Se utiliza para crear Provider, la màs utilizada
    //el listen: false es para que no notifique a la pantalla home page no este oyendo el cambio

    PostProvider postProvider =
        Provider.of<PostProvider>(context, listen: false);
    postProvider.getPosts2();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Listado de items"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      // body: ListView.builder(
      //     itemCount: personProvider.people.length,
      //     itemBuilder: (context, index) {
      //       return ListTile(
      //         title: Text(personProvider.people[index]),
      //         subtitle: const Text("Descripción de items"),
      //       );
      //     }),
      body: Consumer<PostProvider>(
        builder: (context, provider, _) {
          return Text(provider.posts.toString());
        },
      ),

      // body: FutureBuilder(
      //   future: postProvider.getPosts(),
      //   builder: (context, snap) {
      //     if (snap.hasData) {
      //       return Text(snap.data.toString());
      //     }
      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),

      // body: Consumer<PersonProvider>(
      //   builder: (context, provider, _) {
      //     return ListView.builder(
      //       itemCount: personProvider.people.length,
      //       itemBuilder: (context, index) {
      //         return ListTile(
      //           title: Text(personProvider.people[index]),
      //           subtitle: const Text("Descripción de items"),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}
