import 'package:injectable/injectable.dart';
import 'kinerja_api.dart';
import '../../injector/injector.dart';

@Environment(Env.prod)
@Injectable(
  as: KinerjaApi,
)
class ProdKinerjaApi implements KinerjaApi {
  @override
  String baseUrl() => "https://public.accurate.test1";

  @override
  String environment() => 'Production';
}
