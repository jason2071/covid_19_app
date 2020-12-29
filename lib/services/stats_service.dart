import 'dart:convert';
import 'package:covid_19_app/models/timeline_model.dart';
import 'package:covid_19_app/models/today_model.dart';
import 'package:http/http.dart' as http;
import 'package:covid_19_app/models/api_response.dart';

class StatsService {
  static const API = 'https://covid19.th-stat.com';
  final headers = {
    "Content-Type": "application/json",
  };

  Future<APIResponse<TodayModel>> getTodayData() {
    return http.get(API + '/api/open/today', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final body = utf8.decode(data.bodyBytes);
        final jsonDecode = json.decode(body);
        final response = TodayModel.fromJson(jsonDecode);

        return APIResponse<TodayModel>(data: response);
      } else {
        return APIResponse<TodayModel>(
          error: true,
          errorMessage: 'An error occurred',
        );
      }
    }).catchError((_) {
      return APIResponse<TodayModel>(
        error: true,
        errorMessage: 'An error occurred',
      );
    });
  }

  Future<APIResponse<TimelineModel>> getTimelineData() {
    return http.get(API + '/api/open/timeline', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final body = utf8.decode(data.bodyBytes);
        final jsonDecode = json.decode(body);
        final response = TimelineModel.fromJson(jsonDecode);

        return APIResponse<TimelineModel>(data: response);
      } else {
        return APIResponse<TimelineModel>(
          error: true,
          errorMessage: 'An error occurred',
        );
      }
    }).catchError((_) {
      return APIResponse<TimelineModel>(
        error: true,
        errorMessage: 'An error occurred',
      );
    });
  }
}
