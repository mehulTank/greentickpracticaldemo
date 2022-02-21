
import 'package:flutter/foundation.dart';
import 'package:greentickpracticaldemo/data/api/api_path.dart';
import 'package:greentickpracticaldemo/generated/l10n.dart';

part 'assets.dart';

part 'firestore_path.dart';

part 'pref_keys.dart';

part 'strings.dart';

part 'web.dart';

part 'dimens.dart';

class AppConst {
  const AppConst._();

  static var strings = _Strings();
  static var assets = _Assets();
  static var web = _Web();
  static var prefKeys = _PrefKeys();
  static var fireStorePath = _FireStorePath();
  static var dimens = _Dimens();
  static var apiPath = APIPath();
}
