import 'package:flutter/material.dart';
import "package:flutter_resizable_container/flutter_resizable_container.dart";

import "package:go_dart_e2e/widgets/buttons.dart";
import "package:go_dart_e2e/widgets/chat.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 123',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 92, 0, 252),
        ),
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final List<List<Widget>> _items = chatList;
  int _selectedIndex = 0;
  String _selectedChatName = "Эмир тиктокер";

  void _sendMsg() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _items[_selectedIndex].insert(0, MessageBubble(text: text, isMe: true));
      _focusNode.requestFocus();
      _controller.clear();
    });
  }

  void _setIndex(int index, String chatName) {
    setState(() {
      _selectedIndex = index;
      _selectedChatName = chatName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Tabs(
          selectedIndex: _selectedIndex,
          setIndex: _setIndex,
          currentChatName: _selectedChatName,
          scrollDirection: Axis.vertical,
          child: Row(
            mainAxisAlignment: .center,
            children: [
              Expanded(
                child: ResizableContainer(
                  direction: Axis.horizontal,
                  children: [
                    ResizableChild(
                      divider: ResizableDivider(
                        thickness: 5,
                        color: Color.fromARGB(255, 23, 33, 43),
                      ),
                      size: const ResizableSize.expand(min: 250, max: 400),
                      child: Container(
                        width: double.infinity,
                        color: Color.fromARGB(255, 23, 33, 43),
                        child: Column(
                          crossAxisAlignment: .center,
                          mainAxisAlignment: .center,
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                hintText: "Search chats",
                              ),
                            ),
                            Expanded(
                              child: WidgetList(
                                items: chatList1,
                                reverse: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ResizableChild(
                      size: const ResizableSize.expand(min: 500),
                      child: ChatContent(
                        controller: _controller,
                        focusNode: _focusNode,
                        sendMsg: _sendMsg,
                        items: _items,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
