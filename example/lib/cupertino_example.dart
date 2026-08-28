import 'package:flutter/cupertino.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';

void main() {
  runApp(const CupertinoExampleApp());
}

class CupertinoExampleApp extends StatelessWidget {
  const CupertinoExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InterpretedWidget(
      code: cupertinoExampleCode,
      entryPoint: 'CupertinoRootApp',
    );
  }
}

const String cupertinoExampleCode = '''
import 'package:flutter/cupertino.dart';

// Controller for App State
class CupertinoAppStateNotifier extends ChangeNotifier {
  bool isDarkMode = false;
  bool airplaneMode = false;
  bool wifiEnabled = true;
  bool bluetoothEnabled = true;
  bool notificationsEnabled = true;
  double screenBrightness = 0.75;
  double volume = 0.5;
  int downloadCount = 0;
  String searchQuery = '';

  void toggleDarkMode(bool val) {
    isDarkMode = val;
    notifyListeners();
  }

  void toggleAirplane(bool val) {
    airplaneMode = val;
    notifyListeners();
  }

  void toggleWifi(bool val) {
    wifiEnabled = val;
    notifyListeners();
  }

  void toggleBluetooth(bool val) {
    bluetoothEnabled = val;
    notifyListeners();
  }

  void toggleNotifications(bool val) {
    notificationsEnabled = val;
    notifyListeners();
  }

  void setBrightness(double val) {
    screenBrightness = val;
    notifyListeners();
  }

  void setVolume(double val) {
    volume = val;
    notifyListeners();
  }

  void incrementDownload() {
    downloadCount++;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }
}

final appState = CupertinoAppStateNotifier();

class CupertinoRootApp extends StatelessWidget {
  const CupertinoRootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appState,
      builder: (context, child) {
        return CupertinoApp(
          title: 'Cupertino iOS Suite',
          debugShowCheckedModeBanner: false,
          theme: CupertinoThemeData(
            brightness: appState.isDarkMode ? Brightness.dark : Brightness.light,
            primaryColor: CupertinoColors.systemBlue,
            barBackgroundColor: appState.isDarkMode
                ? const Color(0xCC1D1D1D)
                : const Color(0xCCF8F8F8),
            scaffoldBackgroundColor: appState.isDarkMode
                ? CupertinoColors.black
                : CupertinoColors.systemGroupedBackground,
          ),
          home: const MainTabScaffold(),
        );
      },
    );
  }
}

class MainTabScaffold extends StatelessWidget {
  const MainTabScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_grid_2x2),
            label: 'App Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_crop_circle),
            label: 'Profile',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) => const SettingsTabPage(),
            );
          case 1:
            return CupertinoTabView(
              builder: (context) => const AppStoreTabPage(),
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => const ProfileTabPage(),
            );
          default:
            return CupertinoTabView(
              builder: (context) => const SettingsTabPage(),
            );
        }
      },
    );
  }
}

// -------------------------------------------------------------
// 1. SETTINGS TAB PAGE
// -------------------------------------------------------------
class SettingsTabPage extends StatelessWidget {
  const SettingsTabPage({super.key});

  void _showResetDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (dialogContext) {
        return CupertinoAlertDialog(
          title: const Text('Reset All Settings'),
          content: const Text(
            'Are you sure you want to reset all network and display preferences to factory defaults?',
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Cancel'),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                appState.toggleAirplane(false);
                appState.toggleWifi(true);
                appState.toggleBluetooth(true);
                appState.setBrightness(0.5);
                appState.setVolume(0.5);
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Reset'),
            ),
          ],
        );
      },
    );
  }

  void _showThemeActionSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (sheetContext) {
        return CupertinoActionSheet(
          title: const Text('Appearance Options'),
          message: const Text('Select your preferred visual mode for the interface.'),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                appState.toggleDarkMode(false);
                Navigator.of(sheetContext).pop();
              },
              child: const Text('Light Mode (Standard)'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                appState.toggleDarkMode(true);
                Navigator.of(sheetContext).pop();
              },
              child: const Text('Dark Mode (OLED Black)'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(sheetContext).pop();
            },
            child: const Text('Cancel'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Settings'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => _showThemeActionSheet(context),
          child: const Icon(CupertinoIcons.moon_stars),
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          children: [
            // Search Bar
            CupertinoTextField(
              placeholder: 'Search settings, networks, preferences',
              prefix: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 4.0),
                child: Icon(
                  CupertinoIcons.search,
                  size: 20,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              clearButtonMode: OverlayVisibilityMode.editing,
              onChanged: (val) => appState.setSearchQuery(val),
            ),
            const SizedBox(height: 16),

            // Profile Header Card
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: appState.isDarkMode
                    ? CupertinoColors.darkBackgroundGray
                    : CupertinoColors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: CupertinoColors.activeBlue,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Icon(
                        CupertinoIcons.person_fill,
                        color: CupertinoColors.white,
                        size: 28,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Kodjo Dev',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Apple ID, iCloud+, Media & Purchases',
                          style: TextStyle(
                            fontSize: 13,
                            color: CupertinoColors.systemGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    CupertinoIcons.chevron_right,
                    color: CupertinoColors.systemGrey3,
                    size: 18,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Connectivity Section
            const Padding(
              padding: EdgeInsets.only(left: 8.0, bottom: 6.0),
              child: Text(
                'CONNECTIVITY',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: appState.isDarkMode
                    ? CupertinoColors.darkBackgroundGray
                    : CupertinoColors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  _buildSwitchTile(
                    icon: CupertinoIcons.airplane,
                    iconColor: CupertinoColors.systemOrange,
                    title: 'Airplane Mode',
                    value: appState.airplaneMode,
                    onChanged: (val) => appState.toggleAirplane(val),
                  ),
                  Container(
                    height: 0.5,
                    margin: const EdgeInsets.only(left: 48),
                    color: CupertinoColors.separator,
                  ),
                  _buildSwitchTile(
                    icon: CupertinoIcons.wifi,
                    iconColor: CupertinoColors.systemBlue,
                    title: 'Wi-Fi',
                    value: appState.wifiEnabled,
                    onChanged: (val) => appState.toggleWifi(val),
                  ),
                  Container(
                    height: 0.5,
                    margin: const EdgeInsets.only(left: 48),
                    color: CupertinoColors.separator,
                  ),
                  _buildSwitchTile(
                    icon: CupertinoIcons.bluetooth,
                    iconColor: CupertinoColors.systemIndigo,
                    title: 'Bluetooth',
                    value: appState.bluetoothEnabled,
                    onChanged: (val) => appState.toggleBluetooth(val),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Sliders Section
            const Padding(
              padding: EdgeInsets.only(left: 8.0, bottom: 6.0),
              child: Text(
                'DISPLAY & SOUND',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: appState.isDarkMode
                    ? CupertinoColors.darkBackgroundGray
                    : CupertinoColors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(CupertinoIcons.sun_min, color: CupertinoColors.systemGrey),
                      Expanded(
                        child: CupertinoSlider(
                          value: appState.screenBrightness,
                          min: 0.0,
                          max: 1.0,
                          activeColor: CupertinoColors.systemYellow,
                          onChanged: (val) => appState.setBrightness(val),
                        ),
                      ),
                      const Icon(CupertinoIcons.sun_max_fill, color: CupertinoColors.systemYellow),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(CupertinoIcons.volume_mute, color: CupertinoColors.systemGrey),
                      Expanded(
                        child: CupertinoSlider(
                          value: appState.volume,
                          min: 0.0,
                          max: 1.0,
                          activeColor: CupertinoColors.systemBlue,
                          onChanged: (val) => appState.setVolume(val),
                        ),
                      ),
                      const Icon(CupertinoIcons.volume_up, color: CupertinoColors.systemBlue),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Reset Action Button
            CupertinoButton(
              color: CupertinoColors.destructiveRed,
              onPressed: () => _showResetDialog(context),
              child: const Text('Reset All Settings'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Icon(icon, color: CupertinoColors.white, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          CupertinoSwitch(
            value: value,
            activeColor: CupertinoColors.systemGreen,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------------------
// 2. APP STORE TAB PAGE
// -------------------------------------------------------------
class AppStoreTabPage extends StatelessWidget {
  const AppStoreTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('App Store'),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Text(
              'FEATURED',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.systemBlue,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Discover Flutter D4rt',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            _buildAppCard(
              title: 'Flutter D4rt IDE',
              subtitle: 'Interpreted Flutter for iOS & Web',
              iconColor: CupertinoColors.systemIndigo,
              icon: CupertinoIcons.sparkles,
              rating: '4.9 ★★★★★ (1.2K)',
            ),
            const SizedBox(height: 12),
            _buildAppCard(
              title: 'Cupertino Studio',
              subtitle: 'Design native Apple-like UI widgets',
              iconColor: CupertinoColors.systemPurple,
              icon: CupertinoIcons.pencil_outline,
              rating: '4.8 ★★★★★ (890)',
            ),
            const SizedBox(height: 12),
            _buildAppCard(
              title: 'Code Runner Pro',
              subtitle: 'Execute high performance dynamic Dart code',
              iconColor: CupertinoColors.systemTeal,
              icon: CupertinoIcons.play_arrow,
              rating: '5.0 ★★★★★ (3.4K)',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppCard({
    required String title,
    required String subtitle,
    required Color iconColor,
    required IconData icon,
    required String rating,
  }) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: appState.isDarkMode
            ? CupertinoColors.darkBackgroundGray
            : CupertinoColors.white,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Icon(icon, color: CupertinoColors.white, size: 30),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  rating,
                  style: const TextStyle(
                    fontSize: 11,
                    color: CupertinoColors.systemOrange,
                  ),
                ),
              ],
            ),
          ),
          CupertinoButton.filled(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
            onPressed: () => appState.incrementDownload(),
            child: const Text(
              'GET',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------------------
// 3. PROFILE & STATS TAB PAGE
// -------------------------------------------------------------
class ProfileTabPage extends StatelessWidget {
  const ProfileTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Developer Profile'),
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: appState.isDarkMode
                      ? CupertinoColors.darkBackgroundGray
                      : CupertinoColors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CupertinoActivityIndicator(radius: 18.0),
                    const SizedBox(height: 16),
                    const Text(
                      'Live Interpreter Stats',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Total Apps Installed: \${appState.downloadCount}',
                      style: const TextStyle(
                        fontSize: 15,
                        color: CupertinoColors.systemBlue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Brightness: \${(appState.screenBrightness * 100).toInt()}%  •  Volume: \${(appState.volume * 100).toInt()}%',
                      style: const TextStyle(
                        fontSize: 13,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CupertinoButton.filled(
                      onPressed: () => appState.incrementDownload(),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(CupertinoIcons.add_circled, size: 20),
                          SizedBox(width: 6),
                          Text('Simulate App Install'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
''';
