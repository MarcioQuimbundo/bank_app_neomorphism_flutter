import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardsScreen extends StatefulWidget {
  CardsScreen({Key key}) : super(key: key);

  @override
  _CardsScreenState createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 1080, height: 2160, allowFontScaling: false);
    return Scaffold(
        backgroundColor: Color(0xFFF1F3F6),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(120)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil().setHeight(100),
                    ),
                    Text(
                      "Cards",
                      style: TextStyle(
                          color: Color(0xFF4D70A6),
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        socialButton(Icons.home),
                        socialButton(FontAwesomeIcons.film, selected: true),
                        socialButton(FontAwesomeIcons.database),
                        socialButton(Icons.chat_bubble),
                        socialButton(Icons.settings),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          height: ScreenUtil().setHeight(550),
                          margin: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              color: Color(0xFFF1F3F6),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(10, 10),
                                    color: Color(0xFF4D70A6).withOpacity(0.2),
                                    blurRadius: 36),
                                BoxShadow(
                                    offset: Offset(-10, -10),
                                    color: Color.fromARGB(170, 255, 255, 255),
                                    blurRadius: 10),
                              ]),
                        ),
                        Positioned(
                          top: 30,
                          left: 20,
                          child: Icon(
                            FontAwesomeIcons.apple,
                            size: 40,
                            color: Color(0xFF4D70A6).withOpacity(0.5),
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          right: 20,
                          child: Icon(
                            FontAwesomeIcons.ccMastercard,
                            size: 40,
                            color: Color(0xFF4D70A6).withOpacity(0.5),
                          ),
                        ),
                        Positioned(
                          bottom: 60,
                          left: 20,
                          child: Text(
                            "Márcio Quimbundo",
                            style: TextStyle(color: Color(0xFF4D70A6)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: CustomSwitch(
                            activeColor: Color(0xFFF1F3F6),
                            value: status,
                            onChanged: (value) {
                              setState(() {
                                status = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Active",
                          style: TextStyle(
                              color: Color(0xFF4D70A6),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Foce ID before payment",
                          style: TextStyle(
                            color: Color(0xFF4D70A6).withOpacity(.7),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(60),
                    ),
                    Text(
                      "Today",
                      style: TextStyle(
                          color: Color(0xFF4D70A6),
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    listTile("Starbucks Coffee", "55.00 \$", Icons.local_drink),
                    listTile("Transfer to Acidney D.", "55.00 \$",
                        FontAwesomeIcons.exchangeAlt),
                  ],
                )),
          ),
        ));
  }

  Widget listTile(String title, String cost, IconData icon) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      height: ScreenUtil().setHeight(230),
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color: Color(0xFFF1F3F6),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                offset: Offset(10, 10),
                color: Color(0xFF4D70A6).withOpacity(0.2),
                blurRadius: 36),
            BoxShadow(
                offset: Offset(-10, -10),
                color: Color.fromARGB(170, 255, 255, 255),
                blurRadius: 10),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          transationCards(icon),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF4D70A6).withOpacity(.7)),
                ),
                Text(
                  cost,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4D70A6).withOpacity(.7)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget transationCards(IconData icon) {
    return Container(
      height: ScreenUtil().setHeight(130),
      width: ScreenUtil().setHeight(130),
      decoration: BoxDecoration(
          color: Color(0xFFF1F3F6),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                offset: Offset(10, 10),
                color: Color(0xFF4D70A6).withOpacity(0.2),
                blurRadius: 16),
            BoxShadow(
                offset: Offset(-10, -10),
                color: Color.fromARGB(170, 255, 255, 255),
                blurRadius: 10),
          ]),
      child: Icon(
        icon,
        color: Color(0xFF4D70A6),
      ),
    );
  }

  Widget socialButton(IconData icon, {bool selected = false}) {
    return selected
        ? Stack(
            children: <Widget>[
              InnerShadow(
                color: Color(0xFF4D70A6).withOpacity(.2),
                offset: Offset(5, 5),
                blur: 2,
                child: Container(
                  height: ScreenUtil().setHeight(130),
                  width: ScreenUtil().setHeight(130),
                  margin: EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFF1F3F6),
                  ),
                  child: Icon(
                    icon,
                    color: Color(0xFF4D70A6),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 18,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFF4D70A6)),
                ),
              )
            ],
          )
        : Container(
            height: ScreenUtil().setHeight(130),
            width: ScreenUtil().setHeight(130),
            margin: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
                color: Color(0xFFF1F3F6),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(10, 10),
                      color: Color(0xFF4D70A6).withOpacity(0.2),
                      blurRadius: 16),
                  BoxShadow(
                      offset: Offset(-10, -10),
                      color: Color.fromARGB(170, 255, 255, 255),
                      blurRadius: 10),
                ]),
            child: Icon(
              icon,
              color: Color(0xFF4D70A6),
            ),
          );
  }
}
