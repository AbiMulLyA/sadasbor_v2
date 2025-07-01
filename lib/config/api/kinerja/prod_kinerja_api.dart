import 'package:injectable/injectable.dart';

import '../../injector/injector.dart';
import 'kinerja_api.dart';

@Environment(Env.prod)
@Injectable(as: KinerjaApi)
class ProdKinerjaApi implements KinerjaApi {
  @override
  String baseUrl() => "https://public.accurate.test1";

  @override
  String environment() => 'Production';
}
