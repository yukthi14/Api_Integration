abstract class ApiState{
}
class InitialState extends ApiState{
  InitialState();
}
class PhotosState extends ApiState{
  List allData;
  PhotosState({required this.allData});
}
class ErrorMessage extends ApiState{
  String msg;
  ErrorMessage({required this.msg});
}