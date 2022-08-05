import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class shimmer extends StatefulWidget {
  const shimmer({Key? key}) : super(key: key);

  @override
  State<shimmer> createState() => _shimmerState();
}

class _shimmerState extends State<shimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        highlightColor: Colors.grey[400]!,
        baseColor: Colors.grey[300]!,
        enabled: true,
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Card(),
                ),
              );
            }));
  }
}
