import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/module/BusinessScreen/BusinessScreen.dart';
import 'package:news_app/module/GeneralScreen/GeneralScreen.dart';
import 'package:news_app/module/ScienceScreen/ScienceScreen.dart';
import 'package:news_app/module/SportScreen/SportScreen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared/network/local/cacheHelper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(AppInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.article,
        ),
        label: 'General'
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Business'
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'Sport'
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'Science'
    ),
  ];

  List <Widget> screens = [
    GeneralScreen(),
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];

  int currentIndex = 0;

  void changeBottomIndex(index)
  {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  bool isDark = false ;

  void changeMode ({bool? fromShared})
  {
    if(fromShared != null )
      {
        isDark = fromShared;
      }else{
      isDark =! isDark;
     }
    CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
      emit(AppChangeModeState());
    });
  }


  List<dynamic> business = [];

  void getBusiness()
  {
    emit(AppLoadingBusinessState());

    if (business.length == 0 )
      {
        DioHelper.getData(
            url:'v2/top-headlines',
            query: {
              'country':'eg',
              'category':'business',
              'apiKey':'f2dec21c88c94143a9b4ebfd3f715d35',
            }).then((value) {
          business = value.data['articles'];
          emit(AppGetSuccessBusinessState());
        }).catchError((error){
          print('error in get business ${error.toString()}');
          emit(AppGetErrorBusinessState(error.toString()));
        });
      }else{
      emit(AppGetSuccessBusinessState());
    }

  }


  List<dynamic> general = [];

  void getGeneral()
  {
    emit(AppLoadingGeneralState());

    if (general.length == 0 )
      {
        DioHelper.getData(
            url:'v2/top-headlines',
            query: {
              'country':'eg',
              'apiKey':'f2dec21c88c94143a9b4ebfd3f715d35',
            }).then((value) {
          general = value.data['articles'];
          emit(AppGetSuccessGeneralState());
        }).catchError((error){
          print('error in get business ${error.toString()}');
          emit(AppGetErrorGeneralState(error.toString()));
        });
      }else{
      emit(AppGetSuccessGeneralState());
    }

  }


  List<dynamic> sport = [];

  void getSport()
  {
    emit(AppLoadingSportState());

    if(sport.length == 0 )
      {
        DioHelper.getData(
            url:'v2/top-headlines',
            query: {
              'country':'eg',
              'category':'sport',
              'apiKey':'f2dec21c88c94143a9b4ebfd3f715d35',
            }).then((value) {

          sport = value.data['articles'];

          emit(AppGetSuccessSportState());
        }).catchError((error){
          print('error in get business ${error.toString()}');
          emit(AppGetErrorSportState(error.toString()));
        });
      }else{
      emit(AppGetSuccessSportState());
    }


  }


  List<dynamic> science = [];

  void getScience()
  {
    emit(AppLoadingScienceState());

    if(science.length == 0 )
      {
        DioHelper.getData(
            url:'v2/top-headlines',
            query: {
              'country':'eg',
              'category':'science',
              'apiKey':'f2dec21c88c94143a9b4ebfd3f715d35',
            }).then((value) {
          science = value.data['articles'];
          emit(AppGetSuccessScienceState());
        }).catchError((error){
          print('error in get business ${error.toString()}');
          emit(AppGetErrorScienceState(error.toString()));
        });
      }else{
      emit(AppGetSuccessScienceState());
    }


  }

  List<dynamic> search = [];

  void getSearch(String value)
  {
    emit(AppLoadingSearchState());
    search = [];

    DioHelper.getData(
        url:'v2/everything',
        query: {
          'q':'$value',
          'apiKey':'f2dec21c88c94143a9b4ebfd3f715d35',
        }).then((value) {
          search = value.data['articles'];
          print('${value.data['articles']}');

      emit(AppGetSuccessSearchState());
    }).catchError((error){
      print('error in get search ${error.toString()}');
      emit(AppGetErrorSearchState(error.toString()));
    });


  }



}