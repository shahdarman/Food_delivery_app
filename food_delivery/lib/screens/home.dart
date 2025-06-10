import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/screens/model.dart';
import 'package:food_delivery/widgets/custom_text_form_field.dart';
import 'package:food_delivery/screens/home.dart';
import 'package:food_delivery/screens/resturant.dart';
import '../widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> category = [
    CategoryModel(name: 'Buffalo Burger', image: 'images/bufflo.png'),
    CategoryModel(name: 'Just Bakery', image: 'images/just_bakery.png'),
    CategoryModel(name: 'Bremer', image: 'images/bremer.png'),
    CategoryModel(name: 'Coffe Point', image: 'images/coffe_point.png'),
    CategoryModel(name: 'super market', image: 'images/super_market.png'),
  ];

  List<CategoryModel> category1 = [
    CategoryModel(name: 'Food', image: 'images/Food.png'),
    CategoryModel(name: 'Fast Delivery', image: 'images/Fastdelivery.png'),
    CategoryModel(name: 'Super Market', image: 'images/super_market.png'),
    CategoryModel(name: 'Donate', image: 'images/donate.png'),
  ];

  List<CategoryModel> category2 = [
    CategoryModel(name: 'Pharmacy', image: 'images/pharmacy.png'),
    CategoryModel(name: 'Pickup', image: 'images/pickup.png'),
    CategoryModel(name: 'Coffee', image: 'images/coffe.png'),
    CategoryModel(name: 'More Shops', image: 'images/more shops.png'),
  ];

  List<String> items = ["images/Frame 28.png"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5DECB),
      appBar: AppBar(
        backgroundColor: Color(0xffF5DECB),
        leading: SizedBox.shrink(),
        leadingWidth: 8,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Delivering to Almaadi", style: TextStyle(fontSize: 20)),
            Icon(Icons.keyboard_arrow_down_rounded, size: 34),
            Spacer(),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Row(
                children: [
                  SvgPicture.asset("images/Icons/Gift.svg"),
                  SizedBox(width: 10),
                  Text("1118 point",
                      style:
                      TextStyle(fontSize: 12, color: Color(0xff2E2996))),
                  SizedBox(width: 10),
                ],
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          const CustomSearchBar(),


          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(category1.length, (index1) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(category1[index1].image),
                      ),
                      Text(category1[index1].name,
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 20),


          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(category2.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 90,
                        child: Image.asset(category2[index].image),
                      ),
                      SizedBox(height: 3),
                      Text(category2[index].name,
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 20),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(category.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: GestureDetector(
                    onTap: () {
                      if (category[index].name == 'Coffe Point') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CoffeePointMenuScreen()),
                        );
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 90,
                          child: Image.asset(category[index].image),
                        ),
                        Text(category[index].name,
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),

          Spacer(),

          // -- Recommended Section --
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recommended for you",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF4B1515))),
                Text("see all",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color(0xFF4B1515))),
              ],
            ),
          ),

          // -- Banner --
          CarouselSlider.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int itemIndex, int _) =>
                Image.asset(items[itemIndex]),
            options: CarouselOptions(
              height: 150,
              aspectRatio: 1,
              viewportFraction: 0.6,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 3),
              autoPlayInterval: Duration(seconds: 3),
              enlargeCenterPage: true,
              autoPlayCurve: Curves.linear,
            ),
          ),

          Spacer(),
          SizedBox(height: 30),

          // -- Bottom Navigation Bar --
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xFF4B1515),
            unselectedItemColor: Color(0xFF4B1515),
            backgroundColor: Colors.white70,
            onTap: (index) {
              if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CoffeePointMenuScreen()),
                );
              }
            },

            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 23),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 23),
                label: 'Search',

              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_outlined, size: 23),
                activeIcon: Icon(Icons.receipt_long, size: 23),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined, size: 23),
                activeIcon: Icon(Icons.person_2, size: 23),
                label: 'Account',
              ),
            ],
          ),
        ],
      ),
    );
  }
}