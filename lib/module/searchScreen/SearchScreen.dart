import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
        listener: (context , state){},
        builder: (context , state){

          var list = NewsCubit.get(context).search;

          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search',
                      labelStyle: TextStyle(
                        fontSize: 18.0,
                        color: Colors.deepOrange,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.deepOrange,
                      ),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.deepOrange,
                        size: 25.0,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    //controller: searchController,
                    onChanged: (value){
                      NewsCubit.get(context).getSearch(value);
                      print('$value');
                    },
                  ),
                ),
                Expanded(child: articelBuilderItem(list, context , isSearch: true)),
              ],
            ),
          );
        },
    );
  }
}
