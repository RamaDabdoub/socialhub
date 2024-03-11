


import 'package:dartz/dartz.dart';
import 'package:empty_code/core/data/models/common_response.dart';
import 'package:empty_code/core/data/models/post_photo_model.dart';
import 'package:empty_code/core/enums/request_type.dart';
import 'package:empty_code/core/utils/network_util.dart';


class PhotoRepository {
  
  Future<Either<String, List<PostPhotoModel>>> getAllPostPhoto({required int postId}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'albums/$postId/photos',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<PostPhotoModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(PostPhotoModel.fromJson(element));
            },
          );
          return Right(result);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
