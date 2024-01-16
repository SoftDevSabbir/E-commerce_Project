import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionTittle extends StatelessWidget {
  const SectionTittle({
    super.key, required this.tittle, required this.onTapSeeAll,
  });
  final String tittle;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(tittle,style:  TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        TextButton(onPressed: onTapSeeAll, child: Text("See All"))
      ],
    );
  }
}
