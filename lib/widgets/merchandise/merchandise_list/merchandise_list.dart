import 'package:couvee/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MerchandiseList extends StatelessWidget {
  const MerchandiseList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.75,
      maxChildSize: 0.95,
      builder: (
        BuildContext context,
        ScrollController scrollController,
      ) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(0.0, -5.0),
                blurRadius: 40.0,
                color: Colors.black.withOpacity(0.05),
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  "Mau tukar point dimana?",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  controller: scrollController,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  children: <Widget>[
                    MerchandiseItem(
                      text: "Kaliurang",
                      image: "assets/images/merchandise-item1.png",
                    ),
                    MerchandiseItem(
                      text: "Seturan",
                      image: "assets/images/merchandise-item2.png",
                    ),
                    MerchandiseItem(
                      text: "Ahmad Dahlan",
                      image: "assets/images/merchandise-item3.png",
                    ),
                    MerchandiseItem(
                      text: "Wolter Monginsidi",
                      image: "assets/images/merchandise-item4.png",
                    ),
                    MerchandiseItem(
                      text: "Kaliurang",
                      image: "assets/images/merchandise-item1.png",
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
