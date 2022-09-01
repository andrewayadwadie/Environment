class Constants {
  static const String baseUrl = "https://environmentApp.afaqci.com/api";
  static const String photoUrl =
      "https://environmentApp.afaqci.com/Files/Photos";
  static const String epicenterPhotoUrl = "$photoUrl/Epicenters/";

  static const String empty = "";
  static const int zero = 0;
  static const int apiTimeOut = 60 * 1000;
  static const String token = "";
  static const String loginEndPoint = "$baseUrl/Account/Login";
  static const String allEpicenterEndPoint =
      "$baseUrl/Epicenters/GetAllEpicenters";
  static const String allLandFormEndPoint =
      "$baseUrl/LandForms/GetAllLandForms";
  static const String allPollutantReactivitiesEndPoint =
      "$baseUrl/PollutantReactivities/GetAllPollutantReactivities";
  static const String allPollutantPlaceEndPoint =
      "$baseUrl/PollutantPlaces/GetAllPollutantPlaces";
  static const String allSurfaceWaterEndPoint =
      "$baseUrl/SurfaceWaters/GetAllSurfaceWaters";
  static const String allWeatherEndPoint = "$baseUrl/Weathers/GetAllWeathers";
  static const String regionEndPoint = "$baseUrl/Regions/GetAllRegions";
  static const String governorateEndPoint =
      "$baseUrl/Governorates/GetRegionGovernorates";
  static const String citiesEndPoint = "$baseUrl/Cities/GetGovernorateCities";

  static const String industrialActivitiesEndPoint =
      "$baseUrl/IndustrialActivities/GetAllIndustrialActivities";
 static const String industrialPolluationSourceEndPoint =
      "$baseUrl/IndustrialPolluationSources/GetAllIndustrialPolluationSources";
      
}
