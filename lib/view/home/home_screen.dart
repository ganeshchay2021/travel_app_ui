import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travel_app_ui/constant/color.dart';
import 'package:travel_app_ui/model/travel_model.dart';
import 'package:travel_app_ui/view/detailspage/page_details.dart';
import 'package:travel_app_ui/view/home/widgets/popular_destination.dart';
import 'package:travel_app_ui/view/home/widgets/recomendation_locations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> locations = [
    "Lahan, Siraha",
    "Kathmandu, Nepal",
    "Janakpur, Dhanusha",
  ];
  String? selectedValue;

  final List<TravelDestination> popularDestination = myDestination
      .where((element) => element.category == "popular")
      .toList();

  final List<TravelDestination> recommed = myDestination
      .where((element) => element.category == "recomend")
      .toList();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      //header part
      appBar: headerPart(),

      //body Part
      body: Column(
        children: [
          SizedBox(height: 20),

          //popular text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Popular Places",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Spacer(),
                Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: blueTextColor,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          //Popular Places slider
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(popularDestination.length, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageDetails(destination:  popularDestination[index])),
                    );
                  },
                  child: PopularDestination(
                    size: size,
                    popularDestination: popularDestination,
                    idx: index,
                  ),
                );
              }),
            ),
          ),

          SizedBox(height: 20),

          //Recomend
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                //Recomendation Text
                Row(
                  children: [
                    Text(
                      "Recomendation for you",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: blueTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          //recomendation locations
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: recommed.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PageDetails(destination: recommed[index]),
                      ),
                    );
                  },
                  child: RecomendationLocations(
                    size: size,
                    recommed: recommed,
                    idx: index,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  //Home Screen Header Part
  AppBar headerPart() {
    return AppBar(
      actions: [
        SizedBox(width: 20),

        //location Drop Dowiu
        Row(
          children: [
            Icon(Iconsax.location),
            SizedBox(width: 5),
            DropdownButton(
              underline: Container(color: Colors.white),
              hint: Text(
                "Select Location",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              icon: Icon(Icons.keyboard_arrow_down),
              value: selectedValue,
              items: locations.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
          ],
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(1, 2),
              ),
            ],
          ),
          child: Badge(child: Icon(Iconsax.notification)),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
