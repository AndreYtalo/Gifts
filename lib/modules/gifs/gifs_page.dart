import 'package:flutter/material.dart';
import 'package:gifts/modules/detalhes/detalhe_page.dart';
import 'package:gifts/modules/gifs/gifs_controler.dart';

class GifsPage extends StatefulWidget {
  final String title;

  const GifsPage({super.key, required this.title});

  @override
  State<GifsPage> createState() => _GifsPageState();
}

class _GifsPageState extends State<GifsPage> {
  GifsController controller = GifsController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
        body: FutureBuilder<List<String>>(
            future: controller.getgifs(widget.title),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return DetalhesPage(URL: snapshot.data![index]);
                          },
                        ));
                      },
                      child: Card(
                        child: Image.network(snapshot.data![index]),
                      ),
                    );
                  },
                ),
              );
            }));
  }
}
