abstract class AppStrings {
  static String _locale = 'en';

  static void setLocale(String code) {
    _locale = code;
  }

  static String get(String key) =>
      _map[_locale]?[key] ?? _map['en']![key] ?? key;

  // Parametrized helpers
  static String direction(String name) =>
      _locale == 'pl' ? 'Kierunek: $name' : 'Direction: $name';

  static String clientMovements(int x, int y) => _locale == 'pl'
      ? 'Ruchy absolutne klienta: x: $x, y: $y'
      : 'Client Absolute Movements: x: $x, y: $y';

  static const Map<String, Map<String, String>> _map = {
    // ------------------------------------------------------------------ EN --
    'en': {
      'settings': 'Settings',
      'server': 'Server',
      'client': 'Client',
      'language': 'Language',
      'english': 'English',
      'polish': 'Polish',
      'useDefaultServer': 'Use default server',
      'autoStartServer': 'Auto start server on launch',
      'enableBluetooth': 'Enable Bluetooth connection',
      'invertMouseScroll': 'Invert Mouse Scroll',
      'autoDetectUsb': 'Auto Detect USB Devices',
      'quitTitle': 'Do you really want to quit?',
      'no': 'No',
      'yes': 'Yes',
      'appTitle': 'Uni Control Hub',
      'appSubtitle': 'Control your devices with same mouse and keyboard',
      'cursorLocked': 'Cursor locked to current Screen',
      'noClientYet': 'No client connected yet',
      'noClientSubtitle':
          'Connect your device either with bluetooth or usb and refresh',
      'clients': 'Clients',
      'startServer': 'Start Server',
      'startServerSubtitle':
          'Start server to capture mouse and keyboard events',
      'bleTitle': 'Connect via Bluetooth',
      'bleSubtitle':
          'Use bluetooth for emulating Mouse/Keyboard, works with Android and IOS devices',
      'synergyTitle': 'Synergy Server',
      'synergySubtitle': 'Connect to a Synergy Server',
      'clientNameHint': 'Client Name',
      'serverAddressHint': 'Server Address',
      'port': 'Port',
      'save': 'Save',
      'pleaseEnterValue': 'Please enter value',
      'androidConnectionMode': 'Android Connection Mode',
      'lockMouseHotkey': 'Lock Mouse Hotkey',
      'lockMouseToDevice': 'Lock Mouse to Device',
      'selectHotkey': 'Select Hotkey',
      'restartServerEffect':
          'Changes will take effect after you restart the server',
      'uhidPort': 'Uhid Port',
      'invalidPort': 'Invalid Port',
      'clientScreenTitle': "Client's screen size from server's POV",
      'widthRequired': 'Width is required',
      'heightRequired': 'Height is required',
      'width': 'Width',
      'height': 'Height',
      'updateClientSize': 'Update Client Size',
      'clientSizeExplanation':
          'Mouse moves with relative position on client, whereas server produces absolute mouse movements, '
          'Hence we expect client to be of specific size, so that we can move mouse in that size freely',
      'drawerFeedback': 'Send Feedback',
      'drawerDebug': 'Debug Logs',
      'drawerAbout': 'About App',
      'clientInfoText': '''List of connected devices will be available here, There are two types of connections:

### Bluetooth:
> Connect to the server from the bluetooth settings of your mobile, Bluetooth toggle must be enabled.
### USB/ADB:
> Connect to the server by just plugging in the USB cable to your device, or by using UHID mode ( Switch from settings ) connect with ADB

Bluetooth connection is supported by **IOS** and **Android** devices, while USB connection is supported by **Android** devices only.
### Note:
In IOS devices, you need to enable **AssistiveTouch**, only then mouse pointer will be visible.
IOS devices will automatically become visible in the list of connected devices, after connecting via bluetooth,

Whereas After connect/disconnect usb devices, you need to refresh the list of connected devices manually by clicking on the refresh button.''',
      'serverInfoText': '''Server is a core part of the application, it is responsible for managing the connected devices and their interactions. so it must be enabled before connecting any device.

### Server Status:
Server can be started/stopped by clicking on the toggle button, internally it uses [Synergy](https://github.com/symless/synergy-core) server binaries to manage the connected devices.

### Connect via Synergy:

To connect to a synergy or barrier server, disable *Use default server* from settings, and provide the server IP address and port number in the respective fields.''',
      'connectButtonInfoText': '''Connect to the server via bluetooth, works with **Android** and **IOS** devices.

### Steps to connect:

1. Make sure bluetooth is enabled on your device, and enable this toggle button.
2. Open bluetooth settings in your mobile and search for the server in the list of available devices.
3. Click on the server name to connect.
4. After successful connection, you will see the server name in the list of connected devices.
5. On IOS devices, you need to enable **AssistiveTouch** to see the mouse pointer.

To easily toggle **AssistiveTouch** on **IOS** devices, you can use [this](https://www.icloud.com/shortcuts/a3cb85e77744445593665a229bbba440) shortcut

On **Android** devices, make sure to pair first via Bluetooth settings, then enable this toggle.''',
      'androidConnectionModeInfo': '''Android devices can be connected either with **AOA** or with **UHID**

### AOA

This mode simulates a physical HID keyboard and Mouse using the [AOAv2](https://source.android.com/devices/accessories/aoa2#hid-support) protocol.
it works at the USB level directly (so it only works over USB).

Note: On Windows, AOA mode will close ADB connection

### UHID

This mode simulates a physical HID keyboard and Mouse using the [UHID](https://kernel.org/doc/Documentation/hid/uhid.txt) kernel module on the device.
One drawback is that it may not work on old Android versions due to permission errors.
This mode requires ADB, and can also work over wireless ADB

Note: Both devices must be under same network''',
      'lockMouseTileInfo': '''Assign a hotkey to confine the mouse cursor within the bounds of a specific device.
Once locked, the mouse will only move relative to that device's screen.
Pressing the hotkey again will release the lock, allowing the mouse to move freely between devices.''',
    },
    // ------------------------------------------------------------------ PL --
    'pl': {
      'settings': 'Ustawienia',
      'server': 'Serwer',
      'client': 'Klient',
      'language': 'Język',
      'english': 'English',
      'polish': 'Polski',
      'useDefaultServer': 'Używaj domyślnego serwera',
      'autoStartServer': 'Automatyczne uruchamianie serwera',
      'enableBluetooth': 'Włącz połączenie Bluetooth',
      'invertMouseScroll': 'Odwróć przewijanie myszy',
      'autoDetectUsb': 'Automatyczne wykrywanie USB',
      'quitTitle': 'Czy naprawdę chcesz wyjść?',
      'no': 'Nie',
      'yes': 'Tak',
      'appTitle': 'Uni Control Hub',
      'appSubtitle':
          'Steruj swoimi urządzeniami tą samą myszą i klawiaturą',
      'cursorLocked': 'Kursor zablokowany na bieżącym ekranie',
      'noClientYet': 'Brak podłączonego klienta',
      'noClientSubtitle':
          'Podłącz urządzenie przez Bluetooth lub USB i odśwież',
      'clients': 'Klienci',
      'startServer': 'Uruchom serwer',
      'startServerSubtitle':
          'Uruchom serwer, aby przechwytywać zdarzenia myszy i klawiatury',
      'bleTitle': 'Połącz przez Bluetooth',
      'bleSubtitle':
          'Bluetooth do emulacji Myszy/Klawiatury, działa z Android i IOS',
      'synergyTitle': 'Serwer Synergy',
      'synergySubtitle': 'Połącz z serwerem Synergy',
      'clientNameHint': 'Nazwa klienta',
      'serverAddressHint': 'Adres serwera',
      'port': 'Port',
      'save': 'Zapisz',
      'pleaseEnterValue': 'Proszę podać wartość',
      'androidConnectionMode': 'Tryb połączenia Android',
      'lockMouseHotkey': 'Skrót blokady myszy',
      'lockMouseToDevice': 'Zablokuj mysz na urządzeniu',
      'selectHotkey': 'Wybierz skrót',
      'restartServerEffect':
          'Zmiany zostaną zastosowane po restarcie serwera',
      'uhidPort': 'Port UHID',
      'invalidPort': 'Nieprawidłowy port',
      'clientScreenTitle':
          'Rozmiar ekranu klienta (z punktu widzenia serwera)',
      'widthRequired': 'Szerokość jest wymagana',
      'heightRequired': 'Wysokość jest wymagana',
      'width': 'Szerokość',
      'height': 'Wysokość',
      'updateClientSize': 'Zaktualizuj rozmiar klienta',
      'clientSizeExplanation':
          'Mysz porusza się z pozycją względną na kliencie, natomiast serwer generuje absolutne ruchy myszy. '
          'Dlatego oczekujemy, że klient ma określony rozmiar ekranu, aby mysz mogła swobodnie w nim działać.',
      'drawerFeedback': 'Wyślij opinię',
      'drawerDebug': 'Logi diagnostyczne',
      'drawerAbout': 'O aplikacji',
      'clientInfoText': '''Lista podłączonych urządzeń będzie dostępna tutaj. Dostępne są dwa rodzaje połączeń:

### Bluetooth:
> Połącz z serwerem z ustawień Bluetooth w telefonie, Bluetooth musi być włączony.
### USB/ADB:
> Połącz z serwerem podłączając kabel USB lub używając trybu UHID (przełącz w ustawieniach) przez ADB

Połączenie Bluetooth obsługują urządzenia **IOS** i **Android**, natomiast USB obsługuje tylko **Android**.
### Uwaga:
Na urządzeniach IOS musisz włączyć **AssistiveTouch**, tylko wtedy wskaźnik myszy będzie widoczny.
Urządzenia IOS automatycznie pojawią się na liście po połączeniu przez Bluetooth.

Po podłączeniu/odłączeniu urządzenia USB musisz ręcznie odświeżyć listę, klikając przycisk odświeżania.''',
      'serverInfoText': '''Serwer jest kluczową częścią aplikacji — zarządza podłączonymi urządzeniami i ich interakcjami. Musi być włączony przed podłączeniem urządzenia.

### Status serwera:
Serwer można uruchomić/zatrzymać przełącznikiem. Wewnętrznie używa binarek serwera [Synergy](https://github.com/symless/synergy-core).

### Połączenie przez Synergy:

Aby połączyć się z serwerem Synergy lub Barrier, wyłącz opcję *Używaj domyślnego serwera* w ustawieniach i podaj adres IP oraz port serwera.''',
      'connectButtonInfoText': '''Połącz z serwerem przez Bluetooth, działa z urządzeniami **Android** i **IOS**.

### Kroki:

1. Upewnij się, że Bluetooth jest włączony na urządzeniu i włącz ten przełącznik.
2. Otwórz ustawienia Bluetooth na telefonie i wyszukaj serwer na liście dostępnych urządzeń.
3. Kliknij nazwę serwera, aby się połączyć.
4. Po pomyślnym połączeniu zobaczysz serwer na liście podłączonych urządzeń.
5. Na urządzeniach IOS włącz **AssistiveTouch**, aby zobaczyć wskaźnik myszy.

Aby szybko przełączyć **AssistiveTouch** na **IOS**, możesz użyć [tego](https://www.icloud.com/shortcuts/a3cb85e77744445593665a229bbba440) skrótu.

Na urządzeniach **Android** najpierw sparuj przez ustawienia Bluetooth, a następnie włącz ten przełącznik.''',
      'androidConnectionModeInfo': '''Urządzenia Android można podłączyć przez **AOA** lub **UHID**

### AOA

Ten tryb symuluje fizyczną klawiaturę HID i mysz przy użyciu protokołu [AOAv2](https://source.android.com/devices/accessories/aoa2#hid-support).
Działa bezpośrednio na poziomie USB (tylko przez USB).

Uwaga: W systemie Windows tryb AOA zamknie połączenie ADB

### UHID

Ten tryb symuluje fizyczną klawiaturę HID i mysz przy użyciu modułu jądra [UHID](https://kernel.org/doc/Documentation/hid/uhid.txt).
Może nie działać na starszych wersjach Androida z powodu błędów uprawnień.
Wymaga ADB, działa również przez bezprzewodowe ADB.

Uwaga: Oba urządzenia muszą być w tej samej sieci''',
      'lockMouseTileInfo': '''Przypisz skrót klawiszowy, aby ograniczyć kursor myszy do granic konkretnego urządzenia.
Po zablokowaniu mysz będzie się poruszać tylko względem ekranu tego urządzenia.
Ponowne naciśnięcie skrótu zwolni blokadę, umożliwiając swobodne poruszanie myszy między urządzeniami.''',
    },
  };
}
