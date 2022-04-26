import 'package:flutter/material.dart';

//* for recent Notification -------------------->>>>>>>>>>>>>>

Widget listView(int items) {
  return ListView.builder(
      itemBuilder: (context, index) {
        return listViewItems(index, context);
      },
      itemCount: items);
}

Widget listViewItems(int index, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 6),
    child: Container(
      height: 55,
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffC5C5C5),
          ),
          borderRadius: BorderRadius.circular(12),
          color: Color(0xf2ffffff)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          iconType(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [catagory(), oldDescription()],
          ),
          time(),
        ],
      ),
    ),
  );
}

Image iconType() => Image.asset("assets/icons/emergencyIcon.png");

Widget catagory() {
  return const Padding(
    padding: EdgeInsets.only(bottom: 5.0),
    child: Text(
      "Catagory",
      style: TextStyle(
        fontFamily: "SofiaPro",
        fontWeight: FontWeight.w500,
        fontSize: 13,
        color: Color(0xff5B5B5B),
      ),
    ),
  );
}

Text description() {
  return const Text(
    "A Discription of what notfication want to notify for",
    style: TextStyle(
      fontFamily: "SofiaPro",
      fontSize: 10,
      color: Color(0xff5B5B5B),
    ),
  );
}

Text time() {
  return Text(
    "10:08 AM",
    style: TextStyle(
        color: Color(0xff8A8A8A), fontFamily: "SofiaPro", fontSize: 9),
  );
}

//* Old Notification --------------------->>>>>>>>>>>>

Widget oldListView(int items) {
  return ListView.builder(
      itemBuilder: (context, index) {
        return listViewItems(index, context);
      },
      itemCount: items);
}

Widget oldNotifications(int index, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 6),
    child: Container(
      height: 55,
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffC5C5C5),
          ),
          borderRadius: BorderRadius.circular(12),
          color: Color(0xf2ffffff)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          iconType(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [catagory(), oldDescription()],
          ),
          time(),
        ],
      ),
    ),
  );
}

Image onldIconType() => Image.asset("assets/icons/emergencyIcon.png");

Widget oldCatagory() {
  return const Padding(
    padding: EdgeInsets.only(bottom: 5.0),
    child: Text(
      "Catagory",
      style: TextStyle(
        fontFamily: "SofiaPro",
        fontWeight: FontWeight.w500,
        fontSize: 13,
        color: Color(0xff5B5B5B),
      ),
    ),
  );
}

Text oldDescription() {
  return const Text(
    "A Discription of what notfication want to notify for",
    style: TextStyle(
      fontFamily: "SofiaPro",
      fontSize: 10,
      color: Color(0xff5B5B5B),
    ),
  );
}

Text oldTime() {
  return Text(
    "10:08 AM",
    style: TextStyle(
        color: Color(0xff8A8A8A), fontFamily: "SofiaPro", fontSize: 9),
  );
}
