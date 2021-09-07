import 'package:flutter/material.dart';
import 'package:secure_hops/constants.dart';

class DeliverCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            demoAvatar,
          ),
          radius: 30,
        ),
        Container(
          height: 80,
          width: size.width / 1.3,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('deliver to:',
                    style: TextStyle(
                        fontSize: 20,
                        color: kWhiteColor,
                        fontWeight: FontWeight.w500)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width / 1.7,
                      child: Text(
                        '8000 S Kirkland Ave, Chicago, IL ...',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: kWhiteColor, fontSize: 16),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: kWhiteColor,
                        ))
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
