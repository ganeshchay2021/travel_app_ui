
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_ui/constant/color.dart';
import 'package:travel_app_ui/model/travel_model.dart';

class RecomendationLocations extends StatelessWidget {
  const RecomendationLocations({
    super.key,
    required this.size,
    required this.idx,

    required this.recommed,
  });

  final Size size;
  final int idx;

  final List<TravelDestination> recommed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 20,
        left: 20,
        top: 0,
        bottom: 15,
      ),
      child: Container(
        padding: EdgeInsets.all(7),
        height: 110,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(15),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 110,
                width: 130,
                imageUrl: recommed[idx].image![0],
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Container(
                  height: 110,
                  width: 130,
                  decoration: BoxDecoration(color: Colors.black26),
                  child: Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 35,
                  ),
                ),
              ),
            ),
    
            SizedBox(width: 5),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recommed[idx].name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 17),
                      SizedBox(width: 5),
                      Text(
                        recommed[idx].location,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 17,
                      ),
                      SizedBox(width: 5),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: recommed[idx].rate.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            WidgetSpan(child: SizedBox(width: 5)),
                            TextSpan(
                              text:
                                  "(${recommed[idx].review} reviews)",
                              style: TextStyle(
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: recommed[idx].price.toString(),
                        style: TextStyle(
                          color: blueTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: " / Person",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
