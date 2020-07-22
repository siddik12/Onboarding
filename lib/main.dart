import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: One(),
    );
  }
}

class One extends StatefulWidget {
  @override
  _OneState createState() => _OneState();
}

class _OneState extends State<One> {
  final int _totalPage = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: Duration(microseconds: 400),
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10 : 6,
      width: isCurrentPage ? 10 : 6,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: PageView(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page;
            });
          },
          children: <Widget>[
            _buildPageContent(
              imageName: "assets/undraw_mobile_inbox_3h46.svg",
                title: "Find the inbox",
                content:
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of "),
            _buildPageContent(
              imageName: "assets/undraw_Note_list_re_r4u9.svg",
                title: "Take a note every time",
                content:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. hen an unknown printer."),
            _buildPageContent(
              imageName: "assets/undraw_personal_email_t7nw.svg",
                title: "Lorem Ipsum is simply dummy",
                content:
                    "When an unknown printer took a galley of type and scrambled it to make a type specimen book."),
          ],
        ),
      ),
      bottomSheet: _currentPage != _totalPage - 1
          ? Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      _pageController.animateToPage(
                        2,
                        duration: Duration(microseconds: 400),
                        curve: Curves.linear,
                      );
                    },
                    splashColor: Colors.pink[30],
                    child: Text("SKIP",style: TextStyle(color: Colors.pink),),
                  ),

                  Container(
                    child: Row(
                      children: <Widget>[
                        for (int i = 0; i < _totalPage; i++)
                          i == _currentPage
                              ? _buildPageIndicator(true)
                              : _buildPageIndicator(false)
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      _pageController.animateToPage(
                        _currentPage + 1,
                        duration: Duration(microseconds: 400),
                        curve: Curves.linear,
                      );
                    },
                    splashColor: Colors.pink[30],
                    child: Text("NEXT",style: TextStyle(color: Colors.pink),),
                  ),
                ],
              ),
            )
          : Container(
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: Platform.isIOS ? 70.0 : 60.0,
                  color: Colors.pink,
                  alignment: Alignment.center,

                  child: Text(
                    "GET STARTED NOW",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600,color: Colors.white,),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildPageContent({String imageName, String title, String content}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(imageName,width: 200.0,height: 200.0,),
          SizedBox(height: 40.0,),
          Text(
            title,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: Text(
              content,
              style: TextStyle(fontSize: 16.0,),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
