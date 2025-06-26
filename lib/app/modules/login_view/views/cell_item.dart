import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class CellItem extends StatelessWidget {
  const CellItem({super.key, this.imageWidget, this.title, this.onTap});

  final Widget? imageWidget;
  final String? title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        if(onTap != null){
          onTap!();
        }
      },
      child: Container(
        padding: const EdgeInsets.only(left: 15,right: 15),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (imageWidget != null) imageWidget!,
                if (imageWidget != null) const SizedBox(width: 5,),
                Text(title??'',style: const TextStyle(fontSize: 14,color: Colors.black),),
              ],
            ),
            Assets.images.nextInto.image(width: 20,height: 20),
          ],
        ),
      ),
    );
  }
}
