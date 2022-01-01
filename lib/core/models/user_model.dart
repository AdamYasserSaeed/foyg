import 'package:foyg/core/models/tree.dart';

class User {
  final String? name;
  final String? email;
  final String? imgURL;
  final int? level;
  final List<Tree>? forest;

  User({
    this.name,
    this.email,
    this.imgURL,
    this.level,
    this.forest,
  });
}
