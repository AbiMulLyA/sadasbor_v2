// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sadasbor_v2/config/api/bkpsdm/dev_bkpsdm_api.dart' as _i995;
import 'package:sadasbor_v2/config/api/bkpsdm/prod_bkpsdm_api.dart' as _i626;
import 'package:sadasbor_v2/config/api/kinerja/dev_kinerja_api.dart' as _i139;
import 'package:sadasbor_v2/config/api/kinerja/prod_kinerja_api.dart' as _i216;
import 'package:sadasbor_v2/config/api/sadasbor_api.dart' as _i814;
import 'package:sadasbor_v2/config/injector/injector.dart' as _i5;
import 'package:sadasbor_v2/config/router/router.dart' as _i372;
import 'package:sadasbor_v2/config/theme/bloc/theme_bloc.dart' as _i135;
import 'package:sadasbor_v2/core/utils/bloc_wrapper_util.dart' as _i966;
import 'package:sadasbor_v2/core/utils/connection_util.dart' as _i494;
import 'package:sadasbor_v2/core/utils/dio_interceptors_util.dart' as _i104;
import 'package:sadasbor_v2/core/utils/error_util.dart' as _i622;
import 'package:sadasbor_v2/core/utils/global_util.dart' as _i619;
import 'package:sadasbor_v2/core/utils/shared_preferences_util.dart' as _i180;
import 'package:sadasbor_v2/features/auth/presentation/bloc/auth_bloc.dart'
    as _i427;
import 'package:sadasbor_v2/features/auth/utils/auth_util.dart' as _i902;
import 'package:sadasbor_v2/features/dashboard/data/datasources/remote/dashboard_bkpsdm_remote_data_source.dart'
    as _i1061;
import 'package:sadasbor_v2/features/dashboard/data/repository_impl/dashboard_repository_impl.dart'
    as _i453;
import 'package:sadasbor_v2/features/dashboard/domain/repositories/dashboard_repository.dart'
    as _i436;
import 'package:sadasbor_v2/features/dashboard/domain/usecases/posts/dashboard_posts_usecase.dart'
    as _i220;
import 'package:sadasbor_v2/features/dashboard/presentation/bloc/dashboard/dashboard_page_cubit.dart'
    as _i554;
import 'package:sadasbor_v2/features/dashboard/presentation/bloc/posts/dashboard_posts_cubit.dart'
    as _i849;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i554.DashboardPageCubit>(() => _i554.DashboardPageCubit());
    gh.singleton<_i372.AppRouter>(() => registerModule.appRouter);
    gh.singleton<_i966.BlocWrapperUtil>(() => registerModule.blocWrapperUtil);
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => registerModule.storage);
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i135.ThemeBloc>(() => _i135.ThemeBloc());
    gh.lazySingleton<_i494.ConnectionUtil>(() => _i494.ConnectionUtil());
    gh.lazySingleton<_i622.ErrorUtil>(() => _i622.ErrorUtil());
    gh.lazySingleton<_i619.GlobalUtil>(() => _i619.GlobalUtil());
    gh.lazySingleton<_i180.SharedPreferencesUtil>(
      () => _i180.SharedPreferencesUtil(),
    );
    gh.lazySingleton<_i902.AuthUtil>(() => _i902.AuthUtil());
    gh.lazySingleton<_i427.AuthBloc>(
      () => _i427.AuthBloc(authUtil: gh<_i902.AuthUtil>()),
    );
    gh.lazySingleton<_i104.DioInterceptorsUtil>(
      () => _i104.DioInterceptorsUtil(gh<_i361.Dio>()),
    );
    gh.factory<_i814.SadasborApi>(
      () => _i995.DevBkpsdmApi(),
      instanceName: 'BkpsdmApi',
      registerFor: {_dev},
    );
    gh.factory<_i814.SadasborApi>(
      () => _i139.DevKinerjaApi(),
      instanceName: 'KinerjaApi',
      registerFor: {_dev},
    );
    gh.factory<_i361.Dio>(
      () => registerModule.provideMainDio(
        gh<_i814.SadasborApi>(instanceName: 'BkpsdmApi'),
      ),
      instanceName: 'BkpsdmDio',
    );
    gh.factory<_i814.SadasborApi>(
      () => _i626.ProdBkpsdmApi(),
      instanceName: 'BkpsdmApi',
      registerFor: {_prod},
    );
    gh.factory<_i814.SadasborApi>(
      () => _i216.ProdKinerjaApi(),
      instanceName: 'KinerjaApi',
      registerFor: {_prod},
    );
    await gh.singletonAsync<_i814.SadasborApi>(
      () => registerModule.registerDefaultApi(
        gh<_i814.SadasborApi>(instanceName: 'KinerjaApi'),
      ),
      preResolve: true,
    );
    gh.factory<_i361.Dio>(
      () => registerModule.provideSecondaryDio(
        gh<_i814.SadasborApi>(instanceName: 'KinerjaApi'),
      ),
      instanceName: 'KinerjaDio',
    );
    gh.factory<_i1061.DashboardBkpsdmRemoteDataSource>(
      () => _i1061.DashboardBkpsdmRemoteDataSource(
        gh<_i361.Dio>(instanceName: 'BkpsdmDio'),
      ),
    );
    gh.lazySingleton<_i436.DashboardRepository>(
      () => _i453.DashboardRepositoryImpl(
        connectionUtil: gh<_i494.ConnectionUtil>(),
        dio: gh<_i361.Dio>(),
        bkpsdmRemoteDataSource: gh<_i1061.DashboardBkpsdmRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i220.DashboardPostsUseCase>(
      () => _i220.DashboardPostsUseCase(gh<_i436.DashboardRepository>()),
    );
    gh.factory<_i849.DashboardPostsCubit>(
      () => _i849.DashboardPostsCubit(gh<_i220.DashboardPostsUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i5.RegisterModule {}
