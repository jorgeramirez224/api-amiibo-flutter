import 'package:apis/controllers/amiibo_controller.dart';
import 'package:apis/pages/search_amiibo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final amiiboController = Get.find<AmiiboController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: 'Buscar',
            onPressed: () {
              showSearch(context: context, delegate: SearchAmiibo());
            },
            icon: const Icon(Icons.search))
        ],
        title: const Text('Amiibos'),
        backgroundColor: Colors.blueAccent,
      ),
      body: GetBuilder<AmiiboController>(builder: (amiiboController) {
        return (amiiboController.cargando == true)
        ? const Center(
          child: CircularProgressIndicator(),
        ) 
        : GridView.builder(
            itemCount: amiiboController.amiibos.length,
            itemBuilder: (context, i) {
              final amiibo = amiiboController.amiibos[i];
              return GestureDetector(
                onTap: () {
                  amiiboController.amiibo = amiibo;
                  Navigator.pushNamed(context, '/detalles/amiibo');
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueGrey),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                amiibo.name!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: -0,
                      bottom: -0,
                      child: FadeInImage(
                        fit: BoxFit.contain,
                        width: 160,
                        height: 160,
                        placeholder: const AssetImage(
                          'https://media1.giphy.com/media/VJCSpN9VaG7K4p3CUj/200w.gif'),
                        image: NetworkImage(amiibo.image!),
                      ),
                    )
                  ],
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          );
      },
    ),
    );
  }
} 