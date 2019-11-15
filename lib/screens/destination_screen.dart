import 'package:flutter/material.dart';
import 'package:ngendo/models/activity_model.dart';
import 'package:ngendo/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;
  DestinationScreen({this.destination});

  @override
  DestinationState createState() => DestinationState();
}

class DestinationState extends State<DestinationScreen> {

  _buildRatingStars(int rating){
    String stars = "";
    for(int i = 0; i < rating; i++){
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0)
                  ]),
              child: Hero(
                tag: widget.destination.imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 40.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.search),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.sortAmountDown),
                      iconSize: 25.0,
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            left: 20.0,
            bottom: 20.0,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.destination.city,
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.2,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600)),
                  Row(children: <Widget>[
                    Icon(FontAwesomeIcons.locationArrow,
                        size: 10.0, color: Colors.white),
                    SizedBox(width: 5.0),
                    Text(
                      widget.destination.country,
                      style: TextStyle(color: Colors.white),
                    )
                  ])
                ]),
          ),
          Positioned(
            right: 20.0,
            bottom: 20.0,
            child: Icon(Icons.location_on, color: Colors.white70, size: 25.0),
          )
        ]),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
            itemCount: widget.destination.activities.length,
            itemBuilder: (BuildContext context, int index) {
              Activity activity = widget.destination.activities[index];
              return Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 5.0, 20.0, 5.0),
                    height: 170.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding:  EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 120.0,
                                child: Text(
                                  activity.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 17.0, 
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Column(children: <Widget>[
                                Text('\$${activity.price}',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600)),
                                        Text('per pax', style: TextStyle(color: Colors.grey))
                              ])
                            ],
                          ),
                          Text(activity.type, style: TextStyle(color: Colors.grey)),
                          _buildRatingStars(activity.rating),
                          SizedBox(height: 10.0),
                          Row(children: <Widget>[
                            Container(
                               padding: EdgeInsets.all(5.0),
                              width: 70.0,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(10.0)),
                              alignment: Alignment.center,
                              child: Text(activity.startTimes[0]),
                            ),
                            SizedBox(width: 10.0),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              width: 70.0,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(10.0)),
                              alignment: Alignment.center,
                              child: Text(activity.startTimes[1]),
                            )
                          ]),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15.0,
                    bottom: 15.0,
                    top: 15.0,
                                      child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        width: 110.0,
                        fit: BoxFit.cover,
                        image: AssetImage(
                          activity.imageUrl
                        ),
                      )
                    ),
                  )
                ],
              );
            },
          ),
        )
      ],
    ));
  }
}
