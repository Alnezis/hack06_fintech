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

class MerchantAllCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'MerchantAll',
      apiUrl: 'https://alnezis.riznex.ru:1337/statistic/summaryMerchantAll',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class SummaryByMerchantCall {
  static Future<ApiCallResponse> call({
    String merchantName = 'Магнит',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'summaryByMerchant',
      apiUrl: 'https://alnezis.riznex.ru:1337/statistic/summaryByMerchant',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'merchant_name': merchantName,
      },
      returnBody: true,
    );
  }
}

class SummaryUserInMerchantByNameCall {
  static Future<ApiCallResponse> call({
    String userId = '0',
    String merchantName = '0',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'summaryUserInMerchantByName',
      apiUrl: 'https://alnezis.riznex.ru:1337/user/summaryUserInMerchantByName',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'user_id': userId,
        'merchant_name': merchantName,
      },
      returnBody: true,
    );
  }
}

class SummaryUserInMerchantAllSumCall {
  static Future<ApiCallResponse> call({
    String userId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'summaryUserInMerchantAllSum',
      apiUrl: 'https://alnezis.riznex.ru:1337/user/summaryUserInMerchantAllSum',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'user_id': userId,
      },
      returnBody: true,
    );
  }
}

class SummaryUserInMerchantAlluseridCall {
  static Future<ApiCallResponse> call({
    String userId = '0',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'SummaryUserInMerchantAlluserid',
      apiUrl: 'https://alnezis.riznex.ru:1337/user/summaryUserInMerchantAll',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'user_id': userId,
      },
      returnBody: true,
    );
  }
}
