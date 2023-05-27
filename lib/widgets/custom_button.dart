
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onTap,  this.isLoading=false}) : super(key: key);
  final void Function() onTap ;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kPrimaryColor,

        ),
        child: Center(
          child: isLoading ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(color: Colors.black,)) :
          const Text('Add' , style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),),
        ),
      ),
    );
  }
}

