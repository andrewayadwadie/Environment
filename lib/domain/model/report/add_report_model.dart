import 'dart:io';

class ReportModel {
  final String extentOfPolluationDescription;
  final double lat;
  final double long;
  final bool hasResidentialArea;
  final bool hasVegetation;
  final bool hasGroundWater;
  final String epicenterSize;
  final String polluationSize;
  final int epicenterId;
  final int cityId;
  final int landFormId;
  final int pollutantReactivityId;
  final int pollutantPlaceId;
  final int surfaceWaterId;
  final int weatherId;
  final List<File> photos;
  final List<int> reportIndustrialActivitiesIds;
  final List<int> reportIndustrialPolluationSourcesIds;
  final List<int> reportPolluationSourcesIds;
  final List<int> reportPotentialPollutantsIds;
  final List<int> reportSurroundingBuildingsIds;

  ReportModel({
    required this.extentOfPolluationDescription,
    required this.photos,
    required this.lat,
    required this.long,
    required this.hasResidentialArea,
    required this.hasVegetation,
    required this.hasGroundWater,
    required this.epicenterSize,
    required this.polluationSize,
    required this.epicenterId,
    required this.cityId,
    required this.landFormId,
    required this.pollutantReactivityId,
    required this.pollutantPlaceId,
    required this.surfaceWaterId,
    required this.weatherId,
    required this.reportIndustrialActivitiesIds,
    required this.reportIndustrialPolluationSourcesIds,
    required this.reportPolluationSourcesIds,
    required this.reportPotentialPollutantsIds,
    required this.reportSurroundingBuildingsIds,
  });

  factory ReportModel.fromJson(Map<String, dynamic> jsonData) {
    return ReportModel(
      extentOfPolluationDescription:
          jsonData['ExtentOfPolluationDescription'] ?? "",
      long: jsonData['Long'] ?? 0.0,
      lat: jsonData['Lat'] ?? 0.0,
      photos: jsonData['Photos'] ?? [],
      hasResidentialArea: jsonData['HasResidentialArea'] ?? true,
      hasVegetation: jsonData['HasVegetation'] ?? true,
      hasGroundWater: jsonData['HasGroundWater'] ?? true,
      epicenterSize: jsonData['EpicenterSize'] ?? "0.0",
      polluationSize: jsonData['PolluationSize'] ??" 0.0",
      epicenterId: jsonData['EpicenterId'] ?? 0,
      cityId: jsonData['CityId'] ?? 0,
      landFormId: jsonData['LandFormId'] ?? 0,
      pollutantReactivityId: jsonData['PollutantReactivityId'] ?? 0,
      pollutantPlaceId: jsonData['PollutantPlaceId'] ?? 0,
      surfaceWaterId: jsonData['SurfaceWaterId'] ?? 0,
      weatherId: jsonData['WeatherId'] ?? 0,
      reportIndustrialActivitiesIds:
          jsonData['ReportIndustrialActivitiesIds'] ?? [],
      reportIndustrialPolluationSourcesIds:
          jsonData['ReportIndustrialPolluationSourcesIds'] ?? [],
      reportPolluationSourcesIds: jsonData['ReportPolluationSourcesIds'] ?? [],
      reportPotentialPollutantsIds:
          jsonData['ReportPotentialPollutantsIds'] ?? [],
      reportSurroundingBuildingsIds:
          jsonData['ReportSurroundingBuildingsIds'] ?? [],
    );
  }
}
