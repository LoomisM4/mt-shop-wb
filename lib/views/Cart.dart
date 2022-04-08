import 'package:app/objects/CartObj.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  late CartObj cart;

  @override
  void initState() {
    cart = CartObj();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Warenkorb"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            ListView.builder(
              itemCount: cart.articles.length,
              itemBuilder: (context, i) {
                return Row(
                  children: [
                    Text(cart.articles[i].article.name ?? ""),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            cart.remove(cart.articles[i].article);
                            setState(() {
                              cart = CartObj();
                            });
                          },
                          icon: const Icon(Icons.remove)),
                        Text(cart.articles[i].quantity.toString()),
                        IconButton(
                          onPressed: () {
                            cart.add(cart.articles[i].article);
                            setState(() {
                              cart = CartObj();
                            });
                          },
                          icon: const Icon(Icons.add)),
                      ],
                    ),
                    Text(cart.articles[i].calcPositionPrice().toStringAsFixed(2))
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                );
              },
              shrinkWrap: true,
            ),
            Text(cart.calcTotalPrice().toStringAsFixed(2)),
            ElevatedButton(
              onPressed: () {
                cart.articles.clear();
                showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text("Erfolg"),
                      content: Text("Bestellung erfolgreich abgeschickt"),
                      actions: [
                        TextButton(
                            child: const Text("Ok"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }
                          )
                      ],
                    );
                  }
                );
                setState(() {
                  cart = CartObj();
                });
              },
              child: const Text("Zahlungspflichtig bestellen"))
          ],
        ),
      )
    );
  }
}
