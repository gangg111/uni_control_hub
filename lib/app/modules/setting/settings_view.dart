import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:uni_control_hub/app/data/app_strings.dart';
import 'package:uni_control_hub/app/modules/setting/android_connection_mode_tile.dart';
import 'package:uni_control_hub/app/modules/setting/lock_mouse_tile.dart';
import 'package:uni_control_hub/app/modules/setting/uhid_port_tile.dart';
import 'package:uni_control_hub/app/services/app_service.dart';
import 'package:uni_control_hub/app/data/capabilities.dart';
import 'package:uni_control_hub/app/services/synergy_service.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  final SynergyService _synergyService = SynergyService.to;
  final AppService _appService = AppService.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.get('settings')),
        centerTitle: true,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text(AppStrings.get('server')),
            tiles: [
              CustomSettingsTile(
                child: Watch((_) => SettingsTile.switchTile(
                      title: Text(AppStrings.get('useDefaultServer')),
                      initialValue: _appService.userInternalServer.value,
                      onToggle: (value) {
                        _appService.userInternalServer.value = value;
                        if (_synergyService.isSynergyServerRunning.value) {
                          _synergyService.stopServer();
                        }
                      },
                      leading: const Icon(Icons.computer),
                    )),
              ),
              CustomSettingsTile(
                child: Watch((_) => SettingsTile.switchTile(
                      enabled: _appService.userInternalServer.value,
                      title: Text(AppStrings.get('autoStartServer')),
                      initialValue: _appService.autoStartServer.value,
                      onToggle: (value) {
                        _appService.autoStartServer.value = value;
                      },
                      leading: const Icon(Icons.dns),
                    )),
              ),
              if (Capabilities.supportsBleConnection)
                CustomSettingsTile(
                  child: Watch((_) => SettingsTile.switchTile(
                        title: Text(AppStrings.get('enableBluetooth')),
                        initialValue: _appService.enableBluetoothMode.value,
                        onToggle: (value) {
                          _appService.enableBluetoothMode.value = value;
                        },
                        leading: const Icon(Icons.bluetooth),
                      )),
                ),
            ],
          ),
          SettingsSection(
            title: Text(AppStrings.get('client')),
            tiles: [
              const CustomSettingsTile(
                child: LockMouseTile(),
              ),
              const CustomSettingsTile(
                child: AndroidConnectionModeTile(),
              ),
              const CustomSettingsTile(
                child: UhidPortTile(),
              ),
              CustomSettingsTile(
                child: Watch(
                  (_) => SettingsTile.switchTile(
                    title: Text(AppStrings.get('invertMouseScroll')),
                    initialValue: _appService.invertMouseScroll.value,
                    onToggle: (value) {
                      _appService.invertMouseScroll.value = value;
                    },
                    leading: const Icon(Icons.swap_vert),
                  ),
                ),
              ),
              if (Capabilities.canStopUsbTracking)
                CustomSettingsTile(
                  child: Watch(
                    (_) => SettingsTile.switchTile(
                      title: Text(AppStrings.get('autoDetectUsb')),
                      initialValue: _appService.trackUsbConnectedDevices.value,
                      onToggle: (value) {
                        _appService.trackUsbConnectedDevices.value = value;
                      },
                      leading: const Icon(Icons.usb),
                    ),
                  ),
                ),
            ],
          ),
          SettingsSection(
            title: Text(AppStrings.get('language')),
            tiles: [
              CustomSettingsTile(
                child: Watch((_) => SettingsTile(
                      title: Text(AppStrings.get('language')),
                      leading: const Icon(Icons.language),
                      trailing: DropdownButton<String>(
                        value: _appService.locale.value,
                        elevation: 0,
                        underline: const SizedBox(),
                        enableFeedback: false,
                        focusColor: Colors.transparent,
                        items: [
                          DropdownMenuItem(
                            value: 'en',
                            child: Text(AppStrings.get('english')),
                          ),
                          DropdownMenuItem(
                            value: 'pl',
                            child: Text(AppStrings.get('polish')),
                          ),
                        ],
                        onChanged: (String? value) {
                          if (value == null) return;
                          _appService.locale.value = value;
                          _appService.restartApp();
                        },
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
