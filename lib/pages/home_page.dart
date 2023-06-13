import 'package:codigo_states2/pages/provider/notes_provider.dart';
import 'package:codigo_states2/pages/provider/post_provider.dart';
import 'package:codigo_states2/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //Se utiliza para crear Provider, la màs utilizada
      //el listen: false es para que no notifique a la pantalla home page no este oyendo el cambio
      // este còdigo es muy usado
      PostProvider postProvider =
          Provider.of<PostProvider>(context, listen: false);
      postProvider.getPosts2();

      NoteProvider noteProvider =
          Provider.of<NoteProvider>(context, listen: false);
      noteProvider.getNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
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

      // body: Consumer<PostProvider>(
      //   builder: (context, provider, _) {
      //     if (provider.isLoading) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }

      //     //para consumo de servicio desde Privider
      //     return ListView.builder(
      //       itemCount: provider.posts.length,
      //       itemBuilder: ((context, index) {
      //         return ListTile(
      //           title: Text(provider.posts[index]["title"]),
      //           subtitle: Text(provider.posts[index]["body"]),
      //         );
      //       }),
      //     );
      //   },
      // ),

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

      body: Consumer<NoteProvider>(
        builder: (context, provider, _) {
          // if (provider.isLoading) {
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }

          //para consumo de servicio desde Privider
          return ListView.builder(
            itemCount: provider.notes.length,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text(provider.notes[index]["title"]),
                subtitle: Text(provider.notes[index]["description"]),
                trailing: Column(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: provider.notes[index]["status"]
                          ? Colors.greenAccent
                          : Colors.black12,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    InkWell(
                      onTap: () {
                        provider.updateNote(provider.notes[index]["id"]);
                      },
                      child: const Text(
                        "Completar",
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
