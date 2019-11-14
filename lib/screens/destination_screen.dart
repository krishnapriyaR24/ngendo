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
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              activity.name,
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.w600),
                            ),
                            Text('\$${activity.price}')
                          ],
                        ),
                        Text(activity.type),
                        //_buildRatingStars(activity.rating),
                        SizedBox(height: 10.0),
                        Row(children: <Widget>[
                          Container(
                            width: 70.0,
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(10.0)),
                            alignment: Alignment.center,
                            child: Text(activity.startTimes[0]),
                          ),
                          SizedBox(width: 10.0),
                          Container(
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
