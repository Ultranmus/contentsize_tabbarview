import 'package:contentsize_tabbarview/contentsize_tabbarview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CustomTabView(),
    );
  }
}

class CustomTabView extends StatefulWidget {
  const CustomTabView({Key? key}) : super(key: key);

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView>
    with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 700,
              ),
              CustomTabBar(controller: controller),
              ContentSizeTabBarView(
                controller: controller,
                children: List.generate(
                  3,
                  (index) => CustomGridView(
                    data: imageData,
                    size: size,
                    index: index,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.controller,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.white60,
      indicatorColor: Colors.blueAccent,
      controller: controller,
      tabs: const [
        Tab(
            child: Text(
          ' Posts ',
          overflow: TextOverflow.ellipsis,
        )),
        Tab(
            child: Text(
          'Stamp Book',
          overflow: TextOverflow.ellipsis,
        )),
        Tab(
            child: Text(
          'Community',
          overflow: TextOverflow.ellipsis,
        )),
      ],
    );
  }
}

class CustomGridView extends StatelessWidget {
  final List data;
  final Size size;
  final int index;
  const CustomGridView(
      {Key? key, required this.data, required this.size, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      itemCount: index % 2 == 0 ? 15 : 30,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 7,
        crossAxisSpacing: 7,
        crossAxisCount: size.width > 1000
            ? 6
            : size.width > 500
                ? 4
                : 2,
      ),
      itemBuilder: (context, index) {
        return Image.network(
          data[1]['url'].toString(),
          fit: BoxFit.cover,
        );
      },
    );
  }
}

const List<Map<String, String>> imageData = [
  {
    'name': 'Snowy',
    'url':
        'https://images.pexels.com/photos/2173872/pexels-photo-2173872.jpeg?auto=compress&cs=tinysrgb&w=600'
  },
  {
    'name': 'Sandy',
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-S6gVU03fekBnlVWXvncCj6r1kGBqbHyA8Q&usqp=CAU',
  },
];
