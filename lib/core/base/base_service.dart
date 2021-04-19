import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:smg_depo/core/constants/service_constants.dart';
import 'package:smg_depo/core/model/abstract/base_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smg_depo/core/model/concrete/api_model/error_model.dart';
import 'package:smg_depo/core/model/concrete/login/token_model.dart';

class BaseService {
  String _token, _refreshToken;

  Future<T> get<T extends IBaseModel>(String path,
      {IBaseModel model, Object body}) async {
    final storage = new FlutterSecureStorage();
    _token = await storage.read(key: "accessToken");

    final Uri _uri = Uri.http(BASE_URL, "/api/$path", body);

    final response =
        await http.get(_uri, headers: {'Authorization': 'Bearer $_token'});

    debugPrint(response.statusCode.toString());
    switch (response.statusCode) {
      case HttpStatus.ok:
        return _jsonBodyParser<T>(model, response.body);
      case HttpStatus.unauthorized:
        {
          _token = await _getRefreshToken();
          final res = await http
              .get(_uri, headers: {'Authorization': 'Bearer $_token'});
          return _jsonBodyParser<T>(model, res.body);
        }
      default:
        throw response.body;
    }
  }

  Future<T> post<T extends IBaseModel>(
      String path, Object body, IBaseModel model,
      {bool formData = false}) async {
    final Uri _uri = Uri.http(BASE_URL, "/api/$path");

    final storage = new FlutterSecureStorage();
    _token = await storage.read(key: "accessToken");

    var headers;
    if (formData) {
      headers = {'Authorization': 'Bearer $_token'};
    } else {
      headers = {
        'Authorization': 'Bearer $_token',
        'content-type': "application/json"
      };
    }

    try {
      final response = await http.post(_uri, body: body, headers: headers);
      print(response.statusCode);

      if (response.statusCode >= 500) {
        return _jsonBodyParser<T>(
            model,
            json.encode({
              "success": false,
              "message": "Sunucu bağlantı hatası meydana geldi."
            }));
      }

      if (response.statusCode == 401) {
        _token = await _getRefreshToken();
        var res = await http.post(_uri, body: body, headers: headers);
        return _jsonBodyParser(model, res.body);
      }

      return serviceResult<T>(response, model);
    } catch (e) {
      return _jsonBodyParser<T>(
          model,
          json.encode({
            "success": false,
            "message": "Sunucu bağlantı hatası meydana geldi."
          }));
    }
  }

  Future<T> serviceResult<T>(http.Response response, IBaseModel model) async {
    switch (response.statusCode) {
      case HttpStatus.ok:
        return _jsonBodyParser<T>(model, response.body);
      case HttpStatus.badRequest:
        return _jsonBodyParser<T>(model, response.body);
      case HttpStatus.notFound:
        return _jsonBodyParser(
            ErrorModel(),
            json.encode({
              "succes": false,
              "message": "Gönderdiğiniz istek geçerli değil."
            }));
      case HttpStatus.requestTimeout:
        return _jsonBodyParser(
            ErrorModel(),
            json.encode({
              "success": false,
              "message": "Gönderdiğiniz istek zaman aşımına uğradı."
            }));
      case HttpStatus.methodNotAllowed:
        return _jsonBodyParser(
            ErrorModel(),
            json.encode({
              "success": false,
              "message": "Sunucu gönderdiğiniz methodu kabul etmiyor."
            }));
      case HttpStatus.internalServerError:
        return _jsonBodyParser(
            ErrorModel(),
            json.encode({
              "succes": false,
              "message":
                  "Sunucuda bir hata meydana geldi ya da istek karşılanamadı."
            }));
      case HttpStatus.networkConnectTimeoutError:
        return _jsonBodyParser(
            ErrorModel(),
            json.encode({
              "success": false,
              "message": "Sunucu bağlantı zaman aşımı meydana geldi."
            }));
      case HttpStatus.gatewayTimeout:
        return _jsonBodyParser(
            ErrorModel(),
            _jsonBodyParser(
                model,
                json.encode({
                  "success": false,
                  "message":
                      "Gateway veya Proxy sunucusu, kaynağın bulunduğu sunucudan (upstream sunucusu) belirli bir zaman içinde cevap alamadı."
                })));
      default:
        return _jsonBodyParser(
            model,
            json.encode({
              "success": false,
              "message": "Sunucu bağlantı hatası meydana geldi."
            }));
    }
  }

  dynamic _jsonBodyParser<T>(IBaseModel model, String body) {
    if (body != "") {
      final jsonBody = jsonDecode(body);
      if (jsonBody is List) {
        return jsonBody.map((e) => model.fromJson(e)).toList().cast<T>();
      } else if (jsonBody is Map) {
        return model.fromJson(jsonBody);
      } else {
        return jsonBody;
      }
    }
  }

  Future<String> _getRefreshToken() async {
    final storage = new FlutterSecureStorage();
    _refreshToken = await storage.read(key: "refreshToken");
    var queryParams = {"refreshToken": _refreshToken};
    Uri _tokenUri = Uri.http(BASE_URL, "/api/login/refreshToken", queryParams);

    final tokenResult = await http.get(_tokenUri);
    final tokenModel =
        _jsonBodyParser<TokenModel>(TokenModel(), tokenResult.body);
    if (tokenModel != null) {
      storage.deleteAll();
      await storage.write(key: "accessToken", value: tokenModel.accessToken);
      await storage.write(key: "refreshToken", value: tokenModel.refreshToken);
      return tokenModel.accessToken;
    }
    return "";
  }
}
