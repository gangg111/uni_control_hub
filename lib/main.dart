import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:uni_control_hub/app/data/app_strings.dart';
import 'package:uni_control_hub/app/data/app_data.dart';
import 'package:uni_control_hub/app/services/file_service.dart';
import 'package:uni_control_hub/app/services/communication_service.dart';
import 'package:uni_control_hub/app/modules/dashboard/dashboard_view.dart';
import 'package:uni_control_hub/app/services/adb_service.dart';
import 'package:uni_control_hub/app/services/app_service.dart';
import 'package:uni_control_hub/app/services/client_service.dart';
import 'package:uni_control_hub/app/services/native_communication.dart';
import 'package:uni_control_hub/app/services/storage_service.dart';
import 'package:uni_control_hub/app/services/synergy_service.dart';
import 'package:window_manager/window_manager.dart';

Future<void> _initialize(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Disable Signal logs
  SignalsObserver.instance = null;

  // Set default window size
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    size: Size(500, 800),
    minimumSize: Size(300, 600),
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  // Initialize services
  var getIt = GetIt.instance;
  await getIt.registerSingleton(FileService()).init();
  await getIt.registerSingleton(StorageService()).init();

  // Apply language override passed via CLI arg on restart
  final langArg = args
      .where((a) => a.startsWith('--lang='))
      .map((a) => a.substring(7))
      .firstOrNull;
  if (langArg != null && langArg.isNotEmpty) {
    StorageService.to.languageCode = langArg;
    await StorageService.to.save();
  }

  await getIt.registerSingleton(NativeChannelService()).init();
  await getIt.registerSingleton(AppService()).init();
  await getIt.registerSingleton(SynergyService()).init();
  await getIt.registerSingleton(AdbService()).init();
  await getIt.registerSingleton(CommunicationService()).init();
  await getIt.registerSingleton(ClientService()).init();
}

void main(List<String> args) async {
  await _initialize(args);

  runApp(
    Watch((_) {
      final code = AppService.to.locale.value;
      AppStrings.setLocale(code);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: AppService.to.navigatorKey,
        title: AppData.appName,
        locale: Locale(code),
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        home: const DashboardView(),
      );
    }),
  );
}
