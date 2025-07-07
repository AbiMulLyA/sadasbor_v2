import 'package:injectable/injectable.dart';

import '../../injector/injector.dart';
import '../sadasbor_api.dart';

@Environment(Env.prod)
@Named('KinerjaApi')
@Injectable(as: SadasborApi)
class ProdKinerjaApi implements SadasborApi {
  @override
  String baseUrl() => "https://kinerja.tasikmalayakab.go.id";

  @override
  String environment() => 'Production';
}
