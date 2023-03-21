import 'package:api_integration/bloc/bloc_event.dart';
import 'package:api_integration/bloc/bloc_main.dart';
import 'package:api_integration/bloc/bloc_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiIntegration _bloc = ApiIntegration();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.add(GetApiEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade800,
        title: const Text("Api_Integration"),
      ),
      body: Column(
        children: [
          BlocProvider(
            create: (_) => _bloc,
            child: BlocBuilder<ApiIntegration, ApiState>(
                builder: (context, state) {
              if (state is InitialState) {
                return _loadingList(context);
              } else if (state is PhotosState) {
                return _dataList(context, state.allData);
              } else {
                return _loadingList(context);
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget _dataList(BuildContext context, List data) {
    return Expanded(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final photo = data[index];
            return Column(
              children: [
                Text(
                  "Album Id: ${photo["albumId"]}\n",
                  style: const TextStyle(fontSize: 20),
                ),
                Text("Id: ${photo["id"]}\n",style: const TextStyle(fontSize: 20),),
                Text("Title: ${photo["title"]}\n",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                Container(
                    decoration:  BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 3),
                      boxShadow: const [
                        BoxShadow(
                          color:Colors.grey,
                          offset:Offset(
                            10.0,
                            10.0,
                          ),
                          blurRadius:10.0,
                          spreadRadius:3.0,
                        )
                      ]
                    ),
                    child: Image.network(photo["url"])),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      decoration:  BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 3),
                          boxShadow: const [
                            BoxShadow(
                              color:Colors.grey,
                              offset:Offset(
                                10.0,
                                10.0,
                              ),
                              blurRadius:10.0,
                              spreadRadius:3.0,
                            )
                          ]
                      ),
                      child: Image.network(photo["thumbnailUrl"])
                  ),
                ),
                const Divider(
                  color: Colors.teal,
                  thickness: 2,
                ),
              ],
            );
          }),
    );
  }

  Widget _loadingList(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _errorMessage(BuildContext context, String msg) {
    return Center(
      child: Text(msg),
    );
  }
}
