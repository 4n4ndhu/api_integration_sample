import 'package:api_integration_sample/controller/news_screen_controller.dart';
import 'package:api_integration_sample/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<NewsScreenController>().getData();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<NewsScreenController>(
      builder: (context, provideObj, child) => ListView.builder(
        itemCount: provideObj.dataList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        provideObj.dataList[index].urlToImage.toString()),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Text(provideObj.dataList[index].title.toString()),
                SizedBox(
                  height: 5,
                ),
                Text(
                  provideObj.dataList[index].description.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(provideObj.dataList[index].publishedAt.toString()),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
