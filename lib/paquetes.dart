import 'package:http/http.dart' as http;

import 'package:paquetes/classes/pais.dart';
import 'package:paquetes/classes/request_respuesta.dart';

void getReqResp_service(){

   final url = Uri.parse('https://reqres.in/api/users?page=2');

  http.get(url).then((res) {

    //print(res);

    //final body = jsonDecode(res.body);
    //cuando hacemos un DECODE de RES.BODY (de una peticion HTTP que es un JSON), el resultado será un MAPA

    //print(body);
    //print('page: ${body['page']}');
    //print('per_page: ${body['per_page']}');
    //print('id del tercer elemento: ${body[ 'data' ] [2]['id']} ');

    /*Esto es lo mismo que lo de arriba pero más seguro al buscar informacion */
    final resReqRes = reqResRespuestaFromJson( res.body );

    print('page: ${ resReqRes.page}');
    print('per_page: ${ resReqRes.perPage}');
    print('id del tercer elemento: ${resReqRes.data[2].id} ');

  });
}



//TAREA --------------------------------------------------------------------------------------


void getPais(){

   final url = Uri.parse('https://restcountries.com/v3.1/alpha?codes=col');

  http.get(url).then((res) {

  
    final colombia = paisFromJson( res.body );
    
    print('==============================');

    print('Pais: ${ colombia[0].name.common }');
    print('Población: ${ colombia[0].population}');
    print('Fronteras');
    colombia[0].borders.forEach( (f) => print( '    $f'));
    print('Idioma: ${ colombia[0].languages.spa}');
    print('Latitud: ${colombia[0].capitalInfo.latlng[0]}');
    print('Longitud: ${colombia[0].capitalInfo.latlng[1]}');
    print('Moneda: ${colombia[0].currencies.cop.name}');
    print('Bandera: ');


    print('==============================');


  }).catchError((error) => print(error));
}