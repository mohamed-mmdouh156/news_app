abstract class NewsStates {}

class AppInitialState extends NewsStates {}

class AppChangeBottomNavBarState extends NewsStates {}

class AppLoadingBusinessState extends NewsStates{}
class AppGetSuccessBusinessState extends NewsStates{}
class AppGetErrorBusinessState extends NewsStates{

   final String error;
   AppGetErrorBusinessState(this.error);

}


class AppLoadingSportState extends NewsStates{}
class AppGetSuccessSportState extends NewsStates{}
class AppGetErrorSportState extends NewsStates{

   final String error;
   AppGetErrorSportState(this.error);

}

class AppLoadingScienceState extends NewsStates{}
class AppGetSuccessScienceState extends NewsStates{}
class AppGetErrorScienceState extends NewsStates{

   final String error;
   AppGetErrorScienceState(this.error);

}

class AppLoadingGeneralState extends NewsStates{}
class AppGetSuccessGeneralState extends NewsStates{}
class AppGetErrorGeneralState extends NewsStates{

   final String error;
   AppGetErrorGeneralState(this.error);

}

class AppLoadingSearchState extends NewsStates{}
class AppGetSuccessSearchState extends NewsStates{}
class AppGetErrorSearchState extends NewsStates{

   final String error;
   AppGetErrorSearchState(this.error);

}

class AppChangeModeState extends NewsStates{}


