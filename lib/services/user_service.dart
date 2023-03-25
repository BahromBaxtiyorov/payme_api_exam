import 'package:dio/dio.dart';
import '../api.dart';
 import '../config/dio_config.dart';
import '../models/user_model.dart';
import 'log_service.dart';


class GetCardService {
  static final GetCardService _inheritance = GetCardService._init();
  static GetCardService get inheritance => _inheritance;
  GetCardService._init();

  static Future<List<UserModel>?> getCards() async {
    try {
      Response res = await DioConfig.inheritance.createRequest().get(Urls.getUsers);
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());
      if(res.statusCode == 200) {
        List<UserModel> UserList = [];
        for(var e in (res.data as List)) {
          UserList.add(UserModel.fromJson(e));
        }
        Log.w(UserList.length.toString());
        return UserList;
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
      }
    } on DioError catch (e) {
      Log.e(e.toString());
      if(e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
    }
    return null;
  }


  static Future<bool> deleteCards(String id) async {
    try {
      Response res = await DioConfig.inheritance.createRequest().delete(
        Urls.deleteUsers + id,
      );
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
        return false;
      }
    } on DioError catch (e) {
      if(e.response != null) {
        Log.e(e.response!.toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
  }

}