import 'package:injectable/injectable.dart';

import '../../injector/injector.dart';
import 'kinerja_api.dart';

@Environment(Env.dev)
// @Named('dev_accurate_api')
@Injectable(as: KinerjaApi)
class DevKinerjaApi implements KinerjaApi {
  @override
  String baseUrl() => "https://public.accurate.test1";

  @override
  String environment() => 'Development';
}
