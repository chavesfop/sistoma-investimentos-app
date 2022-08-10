import 'package:flutter/material.dart';

const Color backgroundColor = const Color(0xFF4A4A58);
const double menuFontSize = 22;
const double menuItemSpacing = 10;

class MenuDashboardPage extends StatefulWidget {
  const MenuDashboardPage({Key? key}) : super(key: key);

  @override
  State<MenuDashboardPage> createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage> {
  final PageController _pageController = PageController();
  final Duration duration = const Duration(milliseconds: 300);
  bool isCollapsed = true;
  double screenWidth = 0, screenHeight = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context)
        ],
      ),
    );
  }

  Widget menu(context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 50),
                          primary: backgroundColor
                      ),
                    onPressed: () {
                      if (_pageController.hasClients) {
                        _pageController.jumpToPage(0);
                        setState(() {
                          isCollapsed = !isCollapsed;
                        });
                      }
                    },
                    child: const Text("Dashboard", style: TextStyle(color: Colors.white, fontSize: menuFontSize))
                  ),
                  const SizedBox(height: menuItemSpacing),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 50),
                          primary: backgroundColor
                      ),
                      onPressed: () {
                        if (_pageController.hasClients) {
                          _pageController.jumpToPage(1);
                          setState(() {
                            isCollapsed = !isCollapsed;
                          });
                        }
                      },
                      child: const Text("Carteiras", style: TextStyle(color: Colors.white, fontSize: menuFontSize))
                  ),
                  const SizedBox(height: menuItemSpacing),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 50),
                          primary: backgroundColor
                      ),
                      onPressed: () {
                        if (_pageController.hasClients) {
                          _pageController.jumpToPage(2);
                          setState(() {
                            isCollapsed = !isCollapsed;
                          });
                        }
                      },
                      child: const Text("Noticias", style: TextStyle(color: Colors.white, fontSize: menuFontSize))
                  ),
                  const SizedBox(height: menuItemSpacing),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 50),
                          primary: backgroundColor
                      ),
                      onPressed: () {
                        if (_pageController.hasClients) {
                          _pageController.jumpToPage(3);
                          setState(() {
                            isCollapsed = !isCollapsed;
                          });
                        }
                      },
                      child: const Text("Calendario", style: TextStyle(color: Colors.white, fontSize: menuFontSize))
                  ),
                ]
            )
        )
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
        top: isCollapsed ? 0 : 0.2 * screenHeight,
        bottom: isCollapsed ? 0 : 0.2 * screenHeight,
        left: isCollapsed ? 0 : 0.6 * screenWidth,
        right: isCollapsed ? 0 : -0.4 * screenWidth,
        duration: duration,
        child: Material(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
            elevation: 8,
            color: backgroundColor,
            child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top:48),
                child: Column(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(child: const Icon(Icons.menu, color: Colors.white), onTap: (){
                            setState(() {
                              isCollapsed = !isCollapsed;
                            });
                          }),
                          const Text("Sistoma Investimentos", style: TextStyle(fontSize: 24, color: Colors.white)),
                          const Icon(Icons.settings, color: Colors.white),
                        ]
                    ),
                    SizedBox(
                          height: 200,
                          child: PageView(
                            controller: _pageController,
                            scrollDirection: Axis.horizontal,
                            pageSnapping: true,
                            children: <Widget>[
                              Container( //page0
                                  color: Colors.redAccent,
                              ),
                              Container( //page1
                                  color: Colors.greenAccent,
                              ),
                              Container( //page2
                                  color: Colors.blueAccent,
                                  width: 100
                              ),
                              Container( //page3
                                  color: Colors.yellowAccent,
                                  width: 100
                              )
                            ],
                          )
                      )


                  ],
                )
            )
        )
    );
  }
}