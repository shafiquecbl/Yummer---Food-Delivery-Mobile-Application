import 'package:flutter/material.dart';

import 'Order/emptycart.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: EmptyCart(),
    ));
  }
}
