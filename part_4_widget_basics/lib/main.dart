import 'package:flutter/material.dart';
import 'package:part_4_widget_basics/widgets/navigation.dart';
import 'package:part_4_widget_basics/widgets/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late PersistentBottomSheetController? _bottomSheetController;
  int _isBottomSheetVisible = 0;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabList.length, vsync: this);
    _tabController.addListener(() {
      setState() {
        _tabIndex = _tabController.index;
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _tabController.index = index;
      _tabIndex = index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void toggleBottomSheet() {
    if (_isBottomSheetVisible == 0) {
      _isBottomSheetVisible = 1;
      _bottomSheetController = _scaffoldKey.currentState!.showBottomSheet(
        (context) => Container(
          color: Colors.green,
          height: 300,
          child: const Center(
            child: Text('BottomSheet'),
          ),
        ),
      );
    } else {
      _isBottomSheetVisible = 0;
      _bottomSheetController!.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Home Work'),
        actions: [
          IconButton(
            onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      drawer: buildDrawler(),
      endDrawer: buildEndDrowler(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        onTap: _onItemTapped,
        items: buildBottomNavigationBar(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleBottomSheet,
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      body: TabBarView(controller: _tabController, children: tabList),
    );
  }
}
