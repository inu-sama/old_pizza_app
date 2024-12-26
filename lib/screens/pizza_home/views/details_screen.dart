
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_repository/pizza_repository.dart';

import '../../../components/macro.dart';

class DetailsScreen extends StatelessWidget {
  final Pizza pizza;

  const DetailsScreen(
    this.pizza, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text("Details"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(3, 3),
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(
                      pizza.picture,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(3, 3),
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              pizza.name,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "\$${(pizza.price * (100 - pizza.discount) / 100).toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  Text(
                                    "\$${pizza.price.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade500,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        children: [
                          MyMacroWidget(
                            title: "Calories",
                            value: pizza.macros.calories,
                            icon: FontAwesomeIcons.fire,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          MyMacroWidget(
                            title: "Protein",
                            value: pizza.macros.protein,
                            icon: FontAwesomeIcons.dumbbell,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          MyMacroWidget(
                            title: "Carbs",
                            value: pizza.macros.carbs,
                            icon: FontAwesomeIcons.wheatAwn,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          MyMacroWidget(
                            title: "Fat",
                            value: pizza.macros.fat,
                            icon: FontAwesomeIcons.cheese,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            elevation: 3.0,
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
