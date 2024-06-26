import 'package:flutter/material.dart';
import 'package:toku_app/components/item_info.dart';
import 'package:toku_app/models/obj.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.obj, required this.color});

  final Obj obj;
  final Color color;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 107,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            color: const Color(0xffFFF6DC),
            child: Image.asset(obj.image!),
          ),
          Expanded(child: ItemInfo(obj: obj)),
        ],
      ),
    );
  }
}
