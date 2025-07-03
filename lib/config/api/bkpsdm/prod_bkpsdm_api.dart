import 'package:injectable/injectable.dart';
import 'package:sadasbor_v2/config/api/sadasbor_api.dart';

import '../../injector/injector.dart';

@Environment(Env.prod)
@Named('prod_bkpsdm_api')
@Injectable(as: SadasborApi)
class ProdBkpsdmApi implements SadasborApi {
  @override
  String baseUrl() => "https://bkpsdm.tasikmalayakab.go.id";

  @override
  String environment() => 'Production';
}
