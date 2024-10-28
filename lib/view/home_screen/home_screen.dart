import 'package:api_integration_sample/controller/home_screen_controller.dart';
import 'package:api_integration_sample/view/fact_list_screen/fact_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                        builder: (context) => FactListScreen(),
                      ));
                },
                icon: Icon(Icons.arrow_right))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<HomeScreenController>().getFetcheddata();
          },
        ),
        body: Center(
            child: Consumer<HomeScreenController>(
          builder: (context, providerObj, child) => providerObj.isLoading
              ? CircularProgressIndicator()
              : Text(providerObj.resObj?.facts.toString() ?? "no data"),
        )));
  }
}
