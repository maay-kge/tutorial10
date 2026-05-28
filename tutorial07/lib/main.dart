import 'package:flutter/material.dart';
import 'package:tutorial07/database.dart';
import 'package:tutorial07/model/filme_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<Filme> filmes = Database.getFilmes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CINEFlutter'),
          backgroundColor: const Color.fromARGB(78, 117, 215, 1),
        ),

        body: ListView.builder(
          itemCount: filmes.length,
          itemBuilder: (context, index) {
            final filme = filmes[index];

            // Define a cor da estrela
            Color corEstrela =
                filme.imdb > 8.5 ? Colors.amber : Colors.grey;

            return ListTile(
              leading: const Icon(
                Icons.movie,
                color: Color.fromARGB(255, 53, 145, 101),
              ),

              title: Text(filme.titulo),

              subtitle: Text('Ano: ${filme.anoLancamento}'),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star,
                    color: corEstrela,
                    size: 18,
                  ),
                  Text(filme.imdb.toString()),
                ],
              ),

              onTap: () {
                print('Clicou em: ${filme.titulo}');
              },

              // LongPress implementado
              onLongPress: () {
                print('Clicou LongPress em: ${filme.titulo}');
              },
            );
          },
        ),
      ),
    );
  }
}