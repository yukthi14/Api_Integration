import 'dart:convert';
import 'package:api_integration/bloc/bloc_event.dart';
import 'package:api_integration/bloc/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../constants/strings.dart';

class ApiIntegration extends Bloc<ApiEvent,ApiState>{
  ApiIntegration(): super(InitialState()){

    on<GetApiEvent>((event,emit)async{
      try{
        Response response=await http.get(Uri.http(Strings.uri,Strings.path));
        var result=json.decode(response.body) as List;
        emit(PhotosState(allData: result));
      }
      catch(e){
       emit(ErrorMessage(msg:Strings.errorMessage));
      }
    });
  }
}