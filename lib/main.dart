import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Flutter Demo Home Page"),
          ),

          //----SliverPadding
          SliverPadding(
            padding: EdgeInsets.all(40),
            sliver: SliverToBoxAdapter(
              //一對一, 普通的rendorbox到sliver之間的轉換
              child: ElevatedButton(
                child: const FlutterLogo(size: 100),
                onPressed: () {},
              ),
            ),
          ),

          // //----SliverIgnorePointer
          // SliverIgnorePointer(
          //   ignoring: false,
          //   sliver: SliverToBoxAdapter(
          //     //一對一, 普通的rendorbox到sliver之間的轉換
          //     child: ElevatedButton(
          //       child: const FlutterLogo(size: 100),
          //       onPressed: () {},
          //     ),
          //   ),
          // ),

          //----SliverAnimatedOpacity
          const SliverAnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: 1.0,
            sliver: SliverToBoxAdapter(
              //一對一, 普通的rendorbox到sliver之間的轉換
              child: FlutterLogo(
                size: 100,
              ),
            ),
          ),

          //----SliverOpacity
          // const SliverOpacity(
          //   opacity: 0.5,
          //   sliver: const SliverToBoxAdapter(
          //     //一對一, 普通的rendorbox到sliver之間的轉換
          //     child: FlutterLogo(
          //       size: 100,
          //     ),
          //   ),
          // ),
          SliverGrid(
            //一對多的Sliver
            delegate: SliverChildListDelegate([
              const Icon(Icons.animation),
              const Icon(Icons.translate),
              const Icon(Icons.save),
              const Icon(Icons.person),
            ]),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 80),
          ),

          const SliverToBoxAdapter(
            child: Divider(
              thickness: 4.0,
              color: Colors.red,
            ),
          ),

          // //------SliverFillRemaining------
          // const SliverFillRemaining(
          //   child: Center(child: CircularProgressIndicator()),
          // ),

          SliverLayoutBuilder(
            builder: (BuildContext context, SliverConstraints constraints) {
              print(constraints);
              return SliverToBoxAdapter();
            },
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
