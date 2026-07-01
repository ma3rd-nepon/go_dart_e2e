import 'package:flutter/material.dart';
import 'package:go_dart_e2e/services/page_manager.dart';
import 'package:go_dart_e2e/services/pages.dart';
import 'package:go_dart_e2e/widgets/app_tabs_bar.dart';
import 'package:go_dart_e2e/widgets/window.dart';
import 'package:window_manager/window_manager.dart';

class MainAppManager extends StatefulWidget {
  final WindowManager _windowManager;
  const MainAppManager({super.key, required this._windowManager});

  @override
  State<MainAppManager> createState() => _MainAppState();
}

class _MainAppState extends State<MainAppManager> {
  final _navigationManager = PageManager();
  final _overlayManager = PageManager();
  bool _loggedIn = false;

  @override
  void initState() {
    super.initState();
    _initPages();
    _navigationManager.addListener(() => setState(() {}));
    _overlayManager.addListener(() => setState(() {}));
  }

  void _initPages() {
    List<PageEntry> defaultPages = [
      const PageEntry(id: PageId.chat, page: ChatsPage(), canBeClosed: false),
      const PageEntry(id: PageId.calls, page: CallsPage(), canBeClosed: false),
      const PageEntry(
        id: PageId.settings,
        page: SettingsPage(),
        canBeClosed: false,
      ),
      const PageEntry(
        id: PageId.profile,
        page: ProfilePage(),
        canBeClosed: false,
      ),
    ];

    for (final page in defaultPages) {
      _navigationManager.openPage(page);
    }
    _overlayManager.openPage(
      PageEntry(
        id: PageId.frame,
        page: WindowFrame(navManager: _navigationManager),
      ),
    );

    if (!_loggedIn) {
      _overlayManager.openPage(
        PageEntry(
          id: PageId.login,
          page: LoginPage(loginSuccess: onLoginSuccess),
        ),
      );
    }
  }

  void onLoginSuccess() {
    _overlayManager.removePageForever(PageId.login);
    setState(() => _loggedIn = true);
  }

  @override
  void dispose() {
    _navigationManager.dispose();
    _overlayManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_overlayManager.pages.isEmpty) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: Column(
        children: [
          HeaderBar(windowManager: windowManager),
          Expanded(
            child: IndexedStack(
              index: _overlayManager.currentIndex,
              children: _overlayManager.pages.map((e) => e.page).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// bottomNavigationBar: _loggedIn
//     ? AppBottomBar(pageManager: _pageManager)
//     : null,

class WindowFrame extends StatefulWidget {
  final PageManager _navManager;

  const WindowFrame({super.key, required this._navManager});

  @override
  State<WindowFrame> createState() => _WindowFrameState();
}

class _WindowFrameState extends State<WindowFrame> {

   @override
  void initState() {
    super.initState();
    widget._navManager.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext _) {
    return Column(
      children: [
        const MyAppBar(),
        Expanded(
          child: Row(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Expanded(flex: 1, child: AppRailBar(navManager: widget._navManager)),
              Expanded(
                flex: 3,
                child: IndexedStack(
                  index: widget._navManager.currentIndex,
                  children: widget._navManager.pages.map((e) => e.page).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
