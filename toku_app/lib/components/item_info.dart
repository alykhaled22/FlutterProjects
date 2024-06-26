import 'package:flutter/material.dart';
import 'package:toku_app/models/obj.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({super.key, required this.obj});

  final Obj obj;

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(obj.jpName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16, color: Colors.white)),
              Text(obj.enName,
                  style: const TextStyle(fontSize: 16, color: Colors.white)),
            ],
          ),
        ),
        const Spacer(flex: 1),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
            onPressed: () {
              obj.playsound();
            },
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 25,
            ),
          ),
        )
      ],
    );
  }
}
