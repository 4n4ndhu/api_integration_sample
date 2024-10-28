import 'package:api_integration_sample/controller/fact_list_screen_controller.dart';
import 'package:api_integration_sample/view/news_screen/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FactListScreen extends StatefulWidget {
  const FactListScreen({super.key});

  @override
  State<FactListScreen> createState() => _FactListScreenState();
}

class _FactListScreenState extends State<FactListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<FactListScreenController>().getFetcheddata();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsScreen(),
                    ));
              },
              icon: Icon(Icons.arrow_back))
        ],
      ),
      body: Consumer<FactListScreenController>(
        builder: (context, factListScreenController, child) => ListView.builder(
          itemCount: factListScreenController.dataList.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.purple,
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(factListScreenController.dataList[index].length
                      .toString()),
                ),
                title: Text(
                    factListScreenController.dataList[index].fact.toString()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
