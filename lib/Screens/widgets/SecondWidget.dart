import 'package:app_moviefinal/Api/constants.dart';
import 'package:app_moviefinal/Screens/DetailsScreen.dart';
import 'package:flutter/material.dart';

class SecondFileWidget extends StatelessWidget {
  const SecondFileWidget({
    super.key, required this.snapshot,
  });

    final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, itemIndex) {
          return GestureDetector(
             onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Detailsscreen(movie: snapshot.data[itemIndex])));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 200,
                  width: 150,
                   child:Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}',
                ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
