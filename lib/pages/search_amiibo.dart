import 'package:apis/controllers/amiibo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchAmiibo extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // Widgets al lado derecho del Appbar
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Widgets al lado izquierdo del Appbar
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Get.find<AmiiboController>().buscarAmiibos(query);
    // Se ejecuta cada vez que tecleas en el Search
    return GetBuilder<AmiiboController>(builder: (amiiboController) {
      return (query != '')
          ? ListView.builder(
              itemCount: amiiboController.amiiboSearch.length,
              itemBuilder: (context, i) {
                final amiibo = amiiboController.amiiboSearch[i];
                return ListTile(
                  onTap: () {
                    amiiboController.amiibo = amiibo;
                    Navigator.pushNamed(context, '/detalles/amiibo');
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(amiibo.image!),
                  ),
                  title: Text(amiibo.name!),
                  subtitle: Text(amiibo.character!),
                );
              })
          : Container();
    });
  }
}
