import 'package:flutter/material.dart';
import 'package:flutter_d4rt/flutter_d4rt.dart';
import 'cupertino_example.dart';
import 'dartpad_clone_example.dart';

void main() {
  runApp(const UnifiedShowcaseApp());
}

class UnifiedShowcaseApp extends StatefulWidget {
  const UnifiedShowcaseApp({super.key});

  @override
  State<UnifiedShowcaseApp> createState() => _UnifiedShowcaseAppState();
}

class _UnifiedShowcaseAppState extends State<UnifiedShowcaseApp> {
  ThemeMode _themeMode = ThemeMode.system;
  int _currentIndex = 0;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = _themeMode == ThemeMode.dark;

    return MaterialApp(
      title: 'Flutter d4rt',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF8F9FD),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFF12141C),
      ),
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            DartPadScreen(onToggleTheme: _toggleTheme, isDark: isDark),
            const MaterialDynamicShowcase(),
            const CupertinoDynamicShowcase(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.code_outlined),
              selectedIcon: Icon(Icons.code),
              label: 'DartPad Studio',
            ),
            NavigationDestination(
              icon: Icon(Icons.layers_outlined),
              selectedIcon: Icon(Icons.layers),
              label: 'Material 3 Gallery',
            ),
            NavigationDestination(
              icon: Icon(Icons.phone_iphone_outlined),
              selectedIcon: Icon(Icons.phone_iphone),
              label: 'Cupertino iOS',
            ),
          ],
        ),
      ),
    );
  }
}

class MaterialDynamicShowcase extends StatelessWidget {
  const MaterialDynamicShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return InterpretedWidget(
      code: materialExampleCode,
      entryPoint: 'MyApp',
      onError: (err) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Runtime Error: $err',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}

class CupertinoDynamicShowcase extends StatelessWidget {
  const CupertinoDynamicShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return InterpretedWidget(
      code: cupertinoExampleCode,
      entryPoint: 'CupertinoRootApp',
      onError: (err) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Runtime Error: $err',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}

final String materialExampleCode = '''
  import 'package:flutter/material.dart';

// Theme management using ChangeNotifier
class ThemeController extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeController() : super();

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  void toggleTheme() {
    switch (_themeMode) {
      case ThemeMode.system:
        _themeMode = ThemeMode.light;
        break;
      case ThemeMode.light:
        _themeMode = ThemeMode.dark;
        break;
      case ThemeMode.dark:
        _themeMode = ThemeMode.system;
        break;
    }
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  final ThemeController _themeController = ThemeController();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _themeController,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Run Example - Advanced Theming',
          debugShowCheckedModeBanner: false,

          // Light Theme Configuration
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.light,
            ),
            appBarTheme: AppBarTheme(
              centerTitle: true,
              elevation: 2.0,
              shadowColor: Colors.black26,
              titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 4.0,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            cardTheme: CardThemeData(
              elevation: 6.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              margin: EdgeInsets.all(8.0),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              elevation: 8.0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepPurple,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.white,
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              elevation: 6.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            textTheme: TextTheme(
              headlineLarge: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              headlineMedium: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              bodyLarge: TextStyle(fontSize: 16, height: 1.5),
            ),
          ),

          // Dark Theme Configuration
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.dark,
            ),
            appBarTheme: AppBarTheme(
              centerTitle: true,
              elevation: 2.0,
              backgroundColor: Colors.grey[900],
              titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 4.0,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            cardTheme: CardThemeData(
              elevation: 6.0,
              color: Colors.grey[850],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              margin: EdgeInsets.all(8.0),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              elevation: 8.0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepPurpleAccent,
              unselectedItemColor: Colors.grey[400],
              backgroundColor: Colors.grey[900],
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              elevation: 6.0,
              backgroundColor: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            textTheme: TextTheme(
              headlineLarge: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),
              headlineMedium: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              bodyLarge: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.white70,
              ),
            ),
          ),

          // Theme mode (controlled by ThemeController)
          themeMode: _themeController.themeMode,

          home: ComplexApp(themeController: _themeController),
        );
      },
    );
  }
}

class ComplexApp extends StatefulWidget {
  final ThemeController themeController;

  const ComplexApp({super.key, required this.themeController});

  @override
  createState() => ComplexAppState();
}

class ComplexAppState extends State<ComplexApp>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  int counter = 0;
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  increment() {
    setState(() {
      counter++;
    });
    // Restart animation on increment
    _animationController.reset();
    _animationController.forward();
  }

  reset() {
    setState(() {
      counter = 0;
    });
    // Restart animation on reset
    _animationController.reset();
    _animationController.forward();
  }

  addItem() {
    setState(() {
      items.add('Item \${items.length + 1}');
    });
  }

  onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    // Animate tab change
    _animationController.reset();
    _animationController.forward();
  }

  navigateToDetail(String item) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => DetailScreen(item: item)));
  }

  @override
  build(context) {
    List<Widget> screens = [
      HomeScreen(
        counter: counter,
        increment: increment,
        reset: reset,
        fadeAnimation: _fadeAnimation,
        scaleAnimation: _scaleAnimation,
      ),
      ListScreen(
        items: items,
        onItemTap: navigateToDetail,
        fadeAnimation: _fadeAnimation,
      ),
      ProfileScreen(fadeAnimation: _fadeAnimation),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Complex App - Advanced Theming'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            tooltip: 'Search',
          ),
          ListenableBuilder(
            listenable: widget.themeController,
            builder: (context, child) {
              return IconButton(
                icon: Icon(_getThemeIcon()),
                onPressed: () {
                  try {
                    widget.themeController.toggleTheme();
                  } catch (e) {
                    print(e);
                  }
                },
                tooltip: 'Toggle Theme: \${_getThemeLabel()}',
              );
            },
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert),
            tooltip: 'More Options',
            onSelected: (String value) {
              // Handle menu selection
              switch (value) {
                case 'settings':
                  // Navigate to settings
                  break;
                case 'about':
                  // Show about dialog
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('About'),
                      content: Text('Flutter Run Example App v1.0'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                  break;
                case 'help':
                  // Show help
                  break;
                case 'share':
                  // Share app
                  break;
                case 'theme_light':
                  widget.themeController.setThemeMode(ThemeMode.light);
                  break;
                case 'theme_dark':
                  widget.themeController.setThemeMode(ThemeMode.dark);
                  break;
                case 'theme_system':
                  widget.themeController.setThemeMode(ThemeMode.system);
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'settings',
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              PopupMenuItem<String>(
                value: 'about',
                child: ListTile(
                  leading: Icon(Icons.info),
                  title: Text('About'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              PopupMenuDivider(),
              PopupMenuItem<String>(
                value: 'theme_light',
                child: ListTile(
                  leading: Icon(Icons.light_mode),
                  title: Text('Light Theme'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              PopupMenuItem<String>(
                value: 'theme_dark',
                child: ListTile(
                  leading: Icon(Icons.dark_mode),
                  title: Text('Dark Theme'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              PopupMenuItem<String>(
                value: 'theme_system',
                child: ListTile(
                  leading: Icon(Icons.auto_mode),
                  title: Text('System Theme'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              PopupMenuDivider(),
              PopupMenuItem<String>(
                value: 'help',
                child: ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              PopupMenuItem<String>(
                value: 'share',
                child: ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Share'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: _fadeAnimation,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: screens[currentIndex],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }

  IconData _getThemeIcon() {
    switch (widget.themeController.themeMode) {
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
      case ThemeMode.system:
        return Icons.auto_mode;
    }
  }

  String _getThemeLabel() {
    switch (widget.themeController.themeMode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }
}

class HomeScreen extends StatelessWidget {
  final int counter;
  final Function()? increment;
  final Function()? reset;
  final Animation<double> fadeAnimation;
  final Animation<double> scaleAnimation;

  const HomeScreen({
    super.key,
    required this.counter,
    required this.increment,
    required this.fadeAnimation,
    required this.scaleAnimation,
    required this.reset,
  });

  @override
  build(context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Welcome Card with animation
            AnimatedBuilder(
              animation: scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: scaleAnimation.value,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(24.0),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Icon(
                            Icons.trending_up,
                            size: 64.0,
                            color: colorScheme.primary,
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Counter Dashboard',
                            style: theme.textTheme.headlineMedium,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Track your progress with our advanced counter',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16.0),
                          AnimatedBuilder(
                            animation: fadeAnimation,
                            builder: (context, child) {
                              return AnimatedDefaultTextStyle(
                                duration: Duration(milliseconds: 300),
                                style:
                                    theme.textTheme.headlineLarge?.copyWith(
                                      fontSize: 56.0,
                                      color: Color.lerp(
                                        colorScheme.primary,
                                        colorScheme.secondary,
                                        fadeAnimation.value,
                                      ),
                                    ) ??
                                    TextStyle(),
                                child: Text('\$counter'),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20.0),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: increment,
                  icon: Icon(Icons.add),
                  label: Text('Increment'),
                ),
                OutlinedButton.icon(
                  onPressed: reset,
                  icon: Icon(Icons.refresh),
                  label: Text('Reset'),
                ),
              ],
            ),
            SizedBox(height: 20.0),

            // Stats Card with fade animation
            FadeTransition(
              opacity: fadeAnimation,
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.analytics, color: colorScheme.secondary),
                          SizedBox(width: 8.0),
                          Text(
                            'Statistics',
                            style: theme.textTheme.headlineSmall,
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Current Value',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                              Text(
                                '\$counter',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Status',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  color: colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Text(
                                  counter > 10
                                      ? 'High'
                                      : counter > 5
                                      ? 'Medium'
                                      : 'Low',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onPrimaryContainer,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatCard('Tasks', '12', Icons.task_alt, Colors.blue),
                _buildStatCard('Messages', '5', Icons.message, Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: 120.0,
        child: Column(
          children: [
            Icon(icon, color: color, size: 32.0),
            SizedBox(height: 8.0),
            Text(
              value,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Text(title, style: TextStyle(fontSize: 12.0, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class ListScreen extends StatelessWidget {
  final List<String> items;
  final Function(String) onItemTap;
  final Animation<double> fadeAnimation;

  const ListScreen({
    super.key,
    required this.items,
    required this.onItemTap,
    required this.fadeAnimation,
  });

  @override
  build(context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300 + (index * 100)),
            curve: Curves.easeOutBack,
            margin: EdgeInsets.only(bottom: 8.0),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  child: Text('\${index + 1}'),
                ),
                title: Text(items[index]),
                subtitle: Text('Description for \${items[index]}'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () => onItemTap(items[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final Animation<double> fadeAnimation;

  const ProfileScreen({super.key, required this.fadeAnimation});

  @override
  build(context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.deepPurple,
                        child: Icon(
                          Icons.person,
                          size: 50.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'john.doe@example.com',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            _buildProfileOption(Icons.settings, 'Settings'),
            _buildProfileOption(Icons.notifications, 'Notifications'),
            _buildProfileOption(Icons.help, 'Help & Support'),
            _buildProfileOption(Icons.logout, 'Logout'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title) {
    return Card(
      margin: EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {},
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String item;

  const DetailScreen({super.key, required this.item});

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(title: Text(item), backgroundColor: Colors.deepPurple),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info, size: 64.0, color: Colors.deepPurple),
            SizedBox(height: 16.0),
            Text('Details for \$item', style: TextStyle(fontSize: 24.0)),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

    ''';
