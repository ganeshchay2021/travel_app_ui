
import 'package:flutter/material.dart';
import 'package:travel_app_ui/model/travel_model.dart';

class PopularDestination extends StatelessWidget {
  const PopularDestination({
    super.key,
    required this.size,
    required this.idx,
    required this.popularDestination,
  });

  final Size size;
  final int idx;

  final List<TravelDestination> popularDestination;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: idx == 0
          ? EdgeInsets.only(left: 20, right: 20)
          : EdgeInsets.only(right: 20),
      child: Stack(
        children: [
          Container(
            height: size.height * 0.25,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(popularDestination[idx].image![0]),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        popularDestination[idx].name,
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(width: 5),
                          Text(
                            popularDestination[idx].location,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 5),
                      Text(
                        "4.5",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
