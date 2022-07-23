import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterstore/services/serviceApi.dart';
import 'package:http/http.dart' as http;

import '../model/postModel.dart';
import '../widget/items.dart';
import 'productView.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> items = ["electronics", "jewelery", "men's clothing"];

  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    showdata();

    super.initState();
  }

//Api
  showdata() async {
    posts = await RemoteService().getPost();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Store"),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/icons/icons8-shopping-cart-32.png',
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 57,
                child: Items(items: items),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8, top: 5, bottom: 5),
                child: const Text(
                  "Deals of the day",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.5,
                      fontWeight: FontWeight.w500),
                ),
              ),
              //List of Items GridView
              SizedBox(
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3 / 4.5,
                      crossAxisCount: 2,
                      crossAxisSpacing: 30.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // print("Taped");
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductView(
                                    post: posts![index],
                                  )));
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 162, 162, 162),
                                blurRadius: 2.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                  0.0,
                                  0.0,
                                ),
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 5),
                                  child: Container(
                                    child: Center(
                                      child: Image(
                                          image:
                                              NetworkImage(posts![index].image),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 0,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      posts![index]
                                          .category
                                          .toString()
                                          .substring(9)
                                          .toLowerCase(),
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 11),
                                    ),
                                    Text(
                                      posts![index].title,
                                      overflow: TextOverflow.fade,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "₹ ${posts![index].price}",
                                      style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
