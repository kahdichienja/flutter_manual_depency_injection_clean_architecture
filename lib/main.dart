import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/models/freezed/test_api_freezed_model.dart';
import 'data/providers/api_test_provider.dart';
// import 'di/di_container.dart' as di;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await di.init();
  runApp(MultiProvider(
      child: MyApp(),
      providers: [
        ChangeNotifierProvider(create: (context) => ApiTests()),
        // ChangeNotifierProvider.value(value: ApiTests()),
      ],
    ),);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<ApiTests>(context, listen: false).getAllUsers();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> _loadData(BuildContext context) async => await Provider.of<ApiTests>(context, listen: false).getAllUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () => _loadData(context),
        child: Consumer<ApiTests>(
          builder: (BuildContext context, provider, Widget? child) =>
              provider.busy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : provider.testAPIUserModel.length > 0
                      ? SingleChildScrollView(
                          child: Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    provider.testAPIUserModel.length, (index) {
                                  TestAPIUserModel user =
                                      provider.testAPIUserModel[index];
                                  return Card(
                                    child: ListTile(
                                      // onTap: () => provider.getUser(user.id!),
                                      title: Text(user.name!),
                                      subtitle: Text(user.company!.name!),
                                      trailing: Text(user.phone!),
                                    ),
                                  );
                                })),
                          ),
                        )
                      : Center(child: Text("No data")),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
