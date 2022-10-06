import 'package:assign12/Utils/text_styles.dart';
import 'package:flutter/material.dart';

import '../Models/data_model.dart';

class DetailsScreen extends StatelessWidget {
  final DataModel data;
  const DetailsScreen({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(data.title, style: TextStyles.detailsHeadingTextStyle),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Hero(
                  tag: data.imageName,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage(
                              data.imageName,
                            ),
                            fit: BoxFit.fill),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              color: Colors.black26)
                        ]),
                  ),
                ),
              )),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "ATK ${data.attack}",
                style: TextStyles.headingTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
