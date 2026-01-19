import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_ui/constant/color.dart';
import 'package:travel_app_ui/model/travel_model.dart';

class PageDetails extends StatefulWidget {
  final TravelDestination destination;
  const PageDetails({super.key, required this.destination});

  @override
  State<PageDetails> createState() => _PageDetailsState();
}

class _PageDetailsState extends State<PageDetails> {
  int currentIndex = 0;
  int strIndex = 0;

  final List<String> str = ["Overview", "Review"];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: headerPart(context),

      //body part
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 20),

            //slidable image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: size.width,
                height: size.height * 0.60,
                decoration: BoxDecoration(color: Colors.grey.shade100),
                child: Stack(
                  children: [

                    //image slider
                    PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                      },
                      itemCount: widget.destination.image!.length,
                      itemBuilder: (context, index) {
                        final image = widget.destination.image![index];
                        return CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: image,
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
                        );
                      },
                    ),

                    //bottom info
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Column(
                        children: [

                          //small image area
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      widget.destination.image![currentIndex],
                                  errorWidget: (context, url, error) =>
                                      Container(
                                        height: 110,
                                        width: 130,
                                        decoration: BoxDecoration(
                                          color: Colors.black26,
                                        ),
                                        child: Icon(
                                          Icons.error_outline,
                                          color: Colors.red,
                                          size: 35,
                                        ),
                                      ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 15),

                          //botton black area
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(color: Colors.black54),
                            child: Column(
                              children: [

                                //slider icon
                                Padding(
                                  padding: EdgeInsets.only(top: 5, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      widget.destination.image!.length,
                                      (index) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: AnimatedContainer(
                                            duration: Duration(
                                              milliseconds: 400,
                                            ),
                                            height: 3,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: currentIndex == index
                                                  ? Colors.white
                                                  : Colors.grey.shade600,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),

                                //places name and location
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.destination.name,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              widget.destination.location,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey.shade200,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    Spacer(),

                                    //reting and reviews
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 22,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              widget.destination.rate
                                                  .toString(),
                                              style: TextStyle(
                                                height: 0,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "(${widget.destination.review.toString()} reviews)",
                                          style: TextStyle(
                                            height: 0,
                                            fontSize: 16,
                                            color: Colors.grey.shade100,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15),

            //Overview and rewiews 
            Row(
              children: List.generate(str.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      strIndex = index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        border: BoxBorder.fromLTRB(
                          bottom: BorderSide(
                            color: strIndex == index
                                ? blueTextColor
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      // height: 60,
                      child: Text(
                        str[index],
                        style: TextStyle(
                          color: strIndex == index
                              ? blueTextColor
                              : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),

            SizedBox(height: 10),

            //description
            Text(
              widget.destination.description,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),

      //botton nav area
      bottomNavigationBar: Material(
        color: Colors.red,
        elevation: 0,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 90,
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Price", style: TextStyle(fontSize: 16)),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "\$${widget.destination.price}",
                              style: TextStyle(
                                color: blueTextColor,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: " / Person",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  width: size.width * 0.50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.confirmation_number_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Details Screen header Part
AppBar headerPart(BuildContext context) {
  return AppBar(
    actions: [
      SizedBox(width: 15),
      GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(1, 2),
              ),
            ],
          ),
          child: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      Spacer(),
      Text(
        "Details Place",
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
      ),
      Spacer(),
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(1, 2),
            ),
          ],
        ),
        child: Icon(Icons.bookmark_outline),
      ),
      SizedBox(width: 15),
    ],
  );
}
