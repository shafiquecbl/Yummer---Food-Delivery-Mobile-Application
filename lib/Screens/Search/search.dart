import 'package:flutter/material.dart';
import 'package:secure_hops/Screens/Home/components/ItemList.dart';
import 'package:secure_hops/Widgets/navigator.dart';

import 'Filter.dart';
import 'Tabs/SearchBottom.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              onSaved: (value) {},
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
              decoration: InputDecoration(
                  hintText: 'Search for dish...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.filter_alt_outlined),
                    onPressed: () {
                      navigatorPush(context, true, Filter());
                    },
                  )),
            ),
          ),
          SearchTabs(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Popular Restaurants",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: ItemList()),
        ],
      ),
    );
  }
}
