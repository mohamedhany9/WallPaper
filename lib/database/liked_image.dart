
import 'package:hive/hive.dart';

part 'liked_image.g.dart';

@HiveType(typeId: 1)
class LikedImage extends HiveObject {
  @HiveField(0)
  String? name;

  LikedImage({
     this.name,

  });
}