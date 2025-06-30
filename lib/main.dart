import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'config/api/kinerja/kinerja_api.dart';
import 'config/injector/injector.dart';
import 'config/lang/lang.dart';
import 'config/router/router.dart';
import 'config/theme/bloc/theme_bloc.dart';
import 'config/theme/theme.dart';
import 'core/utils/auto_route_observer_util.dart';
import 'core/utils/bloc_observer_utils.dart';
import 'core/utils/connection_util.dart';
import 'core/utils/dio_interceptors_util.dart';
import 'core/utils/error_util.dart';
import 'core/utils/global_util.dart';
import 'core/utils/theme_util.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/home/presentation/pages/home_page.dart';

Future<void> main() async {
  debugPrint('ENV:::::::${Env.dev}');
  await mainApp(Env.dev);
}

Future<void> mainApp(String env) async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await configureInjector(env);

  HttpOverrides.global = MyHttpOverrides();

  debugPrint(env);

  final KinerjaApi kinerjaApi = getIt<KinerjaApi>();

  debugPrint(kinerjaApi.baseUrl());

  final GlobalUtil _globalUtil = getIt<GlobalUtil>();

  debugPrint = (String? message, {int? wrapWidth}) {};
  if (!kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) => _globalUtil
        .debugPrintSynchronouslyWithText(message, '', wrapWidth: wrapWidth);
  }

  // #Region Setup BlocObservers
  EquatableConfig.stringify = !kReleaseMode;

  Bloc.observer = BlocObserverUtils(
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(
        (await getTemporaryDirectory()).path,
      ),
    ),
  );

  runApp(
    EasyLocalization(
      supportedLocales: sadasborLang.entries.map((e) => e.value).toList(),
      path: 'assets/lang',
      startLocale: const Locale('id', 'ID'),
      useOnlyLangCode: true,
      fallbackLocale: const Locale('id', 'ID'),
      child: const App(),
    ),
  );
}

//* App
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late dynamic _connectionChangeStream;
  final _appRouter = getIt<AppRouter>();
  final ErrorUtil _errorUtil = getIt<ErrorUtil>();

  @override
  void initState() {
    super.initState();
    debugPrint('InitState: $runtimeType');

    /// #Region Setup ConnectionUtil
    final ConnectionUtil _connectionUtil = getIt<ConnectionUtil>();
    _connectionUtil.initialize();
    _connectionChangeStream =
        _connectionUtil.connectionChange.listen(_connectionUtil.connectionInfo);

    // #Region Setup Dio
    final dio = getIt<Dio>();
    dio.interceptors.add(DioInterceptorsUtil(dio));

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }

  @override
  void dispose() {
    _connectionChangeStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Build: $runtimeType');
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => getIt<ThemeBloc>())],
      child: BlocProvider(
        create: (_) => getIt<AuthBloc>()..add(const AppStartedEv()),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (BuildContext context, ThemeState tstate) {
            // #Region Setup Theme
            debugPrint('ThemeType Current: ${tstate.themeType}');

            ThemeData? activeTheme = tstate.themeData;
            if (activeTheme == null ||
                tstate.themeType == 'ThemeType.defaults') {
              activeTheme = ThemeUtil.getThemeDefaults(context);
              debugPrint('Theme: Defaults');
            } else {
              debugPrint('Theme: Not Defaults');
            }

            debugPrint(
              'Theme Selected: $activeTheme - ${activeTheme.brightness}',
            );

            final ThemeMode themeMode =
                activeTheme.brightness == Brightness.dark
                ? ThemeMode.dark
                : ThemeMode.light;

            SystemChrome.setEnabledSystemUIMode(
              SystemUiMode.manual,
              overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
            );

            SystemChrome.setSystemUIOverlayStyle(
              SystemUiOverlayStyle(
                statusBarColor: AccurateColor.redAccurate,
                statusBarBrightness: activeTheme.brightness,
                statusBarIconBrightness: activeTheme.brightness,
                systemNavigationBarIconBrightness: activeTheme.brightness,
              ),
            );

            // #Endregion
            return MaterialApp.router(
              routerConfig: _appRouter.config(
                navigatorObservers: () => [
                  AutoRouteObserverUtils(),
                  // ChuckerFlutter.navigatorObserver
                ],
              ),
              key: _appRouter.key,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
              title: KinerjaApi.appName,
              debugShowCheckedModeBanner: false,
              theme: accurateTheme[ThemeType.light],
              themeMode: themeMode,
              builder: (BuildContext context, Widget? widget) {
                ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                  return _errorUtil.widgetError(context, errorDetails);
                };

                return MediaQuery(
                  //Setting font does not change with system font size
                  data: MediaQuery.of(
                    context,
                  ).copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: widget!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MyHomePage(title: '');
    /*    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Template Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );*/
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
