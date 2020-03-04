import 'package:flutterstadia/styleguide/image_asset.dart';

class Friend{
  final String name;
  final String imagePath;
  final bool isOnline;

  Friend(this.name, this.imagePath, this.isOnline);
}

final friends = [
  Friend("Jennie",kFriendJeenie,true),
  Friend("Gena",kFriendGena,false),
  Friend("Michelle",kFriendMichelle,false),
  Friend("Trish",kFriendTrish,false)
];