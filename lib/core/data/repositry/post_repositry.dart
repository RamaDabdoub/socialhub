import 'package:dartz/dartz.dart';
import 'package:empty_code/core/data/models/common_response.dart';
import 'package:empty_code/core/data/models/post_model.dart';
import 'package:empty_code/core/enums/request_type.dart';
import 'package:empty_code/core/utils/network_util.dart';



class PostRepository {
  Future<Either<String, List<PostModel>>> getAllPost() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'posts',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<PostModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(PostModel.fromJson(element));
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
  Future<Either<String, List<PostModel>>> getPostById({required int postId}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'posts/$postId',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<PostModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(PostModel.fromJson(element));
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
   Future<Either<String, PostModel>> CreatPost({
    required String title,
    required String body,}
   ) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        route: 'posts',
         body: {
          "username": title,
          "password": body,
           "userId": '1'
        },
      ).then((value) {
        CommonResponse<Map<String, dynamic>>  commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(PostModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
  Future<Either<String, PostModel>> UpdatePost({
    required String title,
    required String body,
    required int postId,
  }
   ) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.PUT,
        route: 'posts/$postId',
        body: {
          "username": title,
          "password": body,
          "userId": '1',
        },
      
      ).then((value) {
        CommonResponse<Map<String, dynamic>>  commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(PostModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
   Future<Either<String, bool>> DeletePost({
    required int postId,
    
  }
   ) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.DELETE,
        route: 'posts/$postId',
     
      
      ).then((value) {
        CommonResponse<Map<String, dynamic>>  commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
