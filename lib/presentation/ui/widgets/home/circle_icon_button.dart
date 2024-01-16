
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key, required this.ontap, required this.iconData,
  });
  final VoidCallback ontap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(15),
      child: CircleAvatar(
        radius: 15,
        child: Icon(iconData,color: Colors.grey,),
        backgroundColor: Colors.grey.shade300,
      ),
    );
  }
}