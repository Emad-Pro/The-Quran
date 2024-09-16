import 'package:dio/dio.dart';
import 'package:the_quran/core/networking/api_result/api_result.dart';

import '../../../../networking/api_error_handler.dart';
import '../model/audio_url_model/audio_url_model.dart';

class AudioPlayerRepo {
  Future<ApiResult> getAudioUrl(String ayahId, String surahId) async {
    try {
      final response = await Dio()
          .get("https://api.alquran.cloud/v1/ayah/$surahId:$ayahId/ar.alafasy");
      return ApiResult.success(AudioUrlModel.fromJson(response.data));
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
