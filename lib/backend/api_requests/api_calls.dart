import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class ProductRatingCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'ProductRating',
      apiUrl: 'https://alnezis.riznex.ru:1337/statistic/productRating',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class CheckProductsCall {
  static Future<ApiCallResponse> call({
    String userId = '0',
    String checkId = '0',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'CheckProducts',
      apiUrl: 'https://alnezis.riznex.ru:1337/user/check/products',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'user_id': userId,
        'check_id': checkId,
      },
      returnBody: true,
    );
  }
}

class GETChecksCall {
  static Future<ApiCallResponse> call({
    String userId = '0',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GETChecks',
      apiUrl: 'https://alnezis.riznex.ru:1337/user/checks',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'user_id': userId,
      },
      returnBody: true,
    );
  }
}
