import 'package:uuid/uuid.dart';

class Misc {
  static String getUniqueId() {
    Uuid uuid = Uuid();
    return uuid.v4();
  }
}
