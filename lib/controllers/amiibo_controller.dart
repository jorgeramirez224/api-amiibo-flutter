import 'package:apis/api/peticiones_api.dart';
import 'package:apis/models/amiibo_model.dart';
import 'package:get/get.dart';

class AmiiboController extends GetxController {
  @override
  void onInit() {
    obtenerAmiibos();
    super.onInit();
  }

  final peticionesApi = Get.find<PeticionesApi>();
  bool cargando = false;
  List<AmiiboModel> amiibos = [];
  List<AmiiboModel> amiiboSearch = [];
  late AmiiboModel amiibo;

  //Obtener todos los Amiibos
  Future<void> obtenerAmiibos() async {
    cargando = true;
    update();
    final response =
        await peticionesApi.httpGet(url: 'https://amiiboapi.com/api/amiibo/');
    final listaAmiibos = response.body['amiibo'];
    final listaAmiibosModel = List<AmiiboModel>.from(
        listaAmiibos.map((amiibo) => AmiiboModel.fromJsonMap(amiibo)));
    amiibos.addAll(listaAmiibosModel);
    cargando = false;
    update();
  }

  //Buscar un solo Amiibo mediante el Search
  Future buscarAmiibos(String query) async {
    final response = await peticionesApi.httpGet(
        url: 'https://amiiboapi.com/api/amiibo/', query: {'name': query});

    final listaAmiibos = response.body['amiibo'];
    final listaAmiiboModel = List<AmiiboModel>.from(
      listaAmiibos.map(
        (amiibo) => AmiiboModel.fromJsonMap(amiibo),
      ),
    );
    amiiboSearch = listaAmiiboModel;
    update();
  }
}

    //final listaAmiibosModel = List

    /*final listaAmiibosModel = listaAmiibos.map((e) {
      AmiiboModel.fromJsonMap(e);
    }).toList();
    amiibos.addAll(listaAmiibosModel);*/
  
