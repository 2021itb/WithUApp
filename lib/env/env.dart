import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'lib/env/.env', useConstantCase: true)
abstract class Env {
  // OPENAI_API_KEY
  @EnviedField()
  static const String openAiApiKey = _Env.openAiApiKey;
}
