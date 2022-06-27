import 'package:app/objects/CartObj.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget { // 1
  const Cart({Key? key}) : super(key: key); // 3

  @override // 1
  _CartState createState() => _CartState(); // 2
}

class _CartState extends State<Cart> { // 1
  late CartObj cart; // 0

  @override // 1
  void initState() { // 1
    cart = CartObj(); // 2
    super.initState(); // 1
  }

  @override // 1
  Widget build(BuildContext context) { // 1
    return Scaffold( // 2
      appBar: AppBar( // 2
        title: const Text("Warenkorb"), // 2
        backgroundColor: Colors.white, // 2
        foregroundColor: Colors.black, // 2
      ),
      body: Center( // 2
        child: Column( // 2
          children: [ // 1
            ListView.builder( // 1
              itemCount: cart.articles.length, // 3
              itemBuilder: (context, i) { // 1
                return Row( // 2
                  children: [ // 1
                    Text(cart.articles[i].article.name ?? ""), // 5
                    Row( // 1
                      children: [ // 1
                        IconButton( // 1
                          onPressed: () { // 1
                            cart.remove(cart.articles[i].article); // 3
                            setState(() { // 1
                              cart = CartObj(); // 2
                            });
                          },
                          icon: const Icon(Icons.remove)), // 3
                        Text(cart.articles[i].quantity.toString()), // 4
                        IconButton( // 1
                          onPressed: () { // 1
                            cart.add(cart.articles[i].article); // 3
                            setState(() { // 1
                              cart = CartObj(); // 2
                            });
                          },
                          icon: const Icon(Icons.add)), // 3
                      ],
                    ),
                    Text(cart.articles[i].calcPositionPrice().toStringAsFixed(2)) // 4
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // 2
                );
              },
              shrinkWrap: true, // 1
            ),
            Text(cart.calcTotalPrice().toStringAsFixed(2)), // 3
            ElevatedButton( // 1
              onPressed: () { // 1
                cart.articles.clear(); // 2
                showDialog( // 1
                  context: context, // 1
                  builder: (context) { // 1
                    return CupertinoAlertDialog( // 2
                      title: Text("Erfolg"), // 2
                      content: Text("Bestellung erfolgreich abgeschickt"), // 2
                      actions: [ // 1
                        TextButton( // 1
                            child: const Text("Ok"), // 2
                            onPressed: () { // 1
                              Navigator.of(context).pop(); // 2
                            }
                          )
                      ],
                    );
                  }
                );
                setState(() { // 1
                  cart = CartObj(); // 2
                });
              },
              child: const Text("Zahlungspflichtig bestellen")) // 2
          ],
        ),
      )
    );
  }
}

// 106
