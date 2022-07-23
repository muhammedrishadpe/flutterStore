import 'package:flutter/material.dart';
import 'package:flutterstore/model/postModel.dart';

import '../core/constant.dart';

class ProductView extends StatelessWidget {
  final Post post;
  const ProductView({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(post.title)),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("dafffffffffffta"),
              Center(
                child: SizedBox(
                  width: 200,
                  child: Image(
                    image: NetworkImage(post.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Text(
                post.title,
                style: style1,
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/icons8-star-24.png',
                      color: post.rating.rate > 1
                          ? const Color.fromARGB(255, 221, 199, 0)
                          : const Color.fromARGB(255, 142, 142, 142),
                    ),
                    Image.asset(
                      'assets/icons/icons8-star-24.png',
                      color: post.rating.rate > 2
                          ? const Color.fromARGB(255, 221, 199, 0)
                          : const Color.fromARGB(255, 142, 142, 142),
                    ),
                    Image.asset(
                      'assets/icons/icons8-star-24.png',
                      color: post.rating.rate > 3
                          ? const Color.fromARGB(255, 221, 199, 0)
                          : const Color.fromARGB(255, 142, 142, 142),
                    ),
                    Image.asset(
                      'assets/icons/icons8-star-24.png',
                      color: post.rating.rate > 4
                          ? const Color.fromARGB(255, 221, 199, 0)
                          : const Color.fromARGB(255, 142, 142, 142),
                    ),
                    Image.asset(
                      'assets/icons/icons8-star-24.png',
                      color: post.rating.rate > 4.5
                          ? const Color.fromARGB(255, 221, 199, 0)
                          : const Color.fromARGB(255, 142, 142, 142),
                    ),
                    Text("${post.rating.count} ratings", style: styleW3)
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "₹ ${post.price}",
                style: style2,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Description",
                style: style2,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                post.description,
                softWrap: true,
                style: styleW3,
              ),
            ],
          ),
        ));
  }
}
