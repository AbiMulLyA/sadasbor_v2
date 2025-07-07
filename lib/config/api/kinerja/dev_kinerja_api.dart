import 'package:injectable/injectable.dart';

import '../../injector/injector.dart';
import '../sadasbor_api.dart';

@Environment(Env.dev)
@Named('KinerjaApi')
@Injectable(as: SadasborApi)
class DevKinerjaApi implements SadasborApi {
  @override
  String baseUrl() => "https://kinerja.tasikmalayakab.go.id";

  @override
  String environment() => 'Development';
}
