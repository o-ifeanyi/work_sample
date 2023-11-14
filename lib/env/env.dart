import 'package:envied/envied.dart';

part 'generated/env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'ABLY_KEY')
  static const String ablyKey = _Env.ablyKey;
}
