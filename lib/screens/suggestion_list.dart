import 'package:flutter/material.dart';
import '../palette.dart';
import '../widgets/cluster_slider.dart';

class suggestionList extends StatefulWidget {
  const suggestionList({Key? key}) : super(key: key);

  @override
  State<suggestionList> createState() => _suggestionListState();
}

class _suggestionListState extends State<suggestionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("اشخاص على طريقك",textAlign:TextAlign.center ,),backgroundColor: secondary,automaticallyImplyLeading: false),
      backgroundColor:third,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClusterSlider(),
              SizedBox(
                height: 30,
              ),
              ClusterSlider()
            ],
          ),
        ),
      ),
    );
  }
}
