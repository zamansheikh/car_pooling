import 'package:car_pooling/core/constant/api_constants.dart';

String imageUrl(String? url) {
  if (url == null || url.isEmpty) {
    return "https://media.istockphoto.com/id/1223671392/vector/default-profile-picture-avatar-photo-placeholder-vector-illustration.jpg?s=612x612&w=0&k=20&c=s0aTdmT5aU6b8ot7VKm11DeID6NctRCpB755rA1BIP0=";
  } else {
    if (url.startsWith("http")) {
      return url;
    }
    return ApiConstants.baseAssetURL + url;
  }
}
