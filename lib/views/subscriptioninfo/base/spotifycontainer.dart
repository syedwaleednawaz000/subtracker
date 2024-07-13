import 'package:flutter/cupertino.dart';

import '../../../utils/my_size.dart';

class SpotifyContainer extends StatelessWidget {
  final String image;
  final Color color;
  const SpotifyContainer({super.key, required this.image, required this.color,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:MySize.scaleFactorHeight*130 ,
      width:MySize.scaleFactorWidth*60,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.circular(MySize.size54),
      ),
      child:Image.asset(image),
    );
  }
}
