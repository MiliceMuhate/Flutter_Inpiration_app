import 'package:flutter/material.dart';

Widget promoCard(image, nome) {
  return AspectRatio(
    aspectRatio: 2.62 / 3,
    child: Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient:
                LinearGradient(begin: Alignment.bottomRight, stops: const [
              .1,
              .6
            ], colors: [
              Colors.black.withOpacity(.6),
              Colors.black.withOpacity(.1),
            ])),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              nome,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget bigPromoCard(image, nome) {
  return Container(
    height: 150,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(image))),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(begin: Alignment.bottomRight, stops: const [
            .1,
            .6
          ], colors: [
            Colors.black.withOpacity(.6),
            Colors.black.withOpacity(.1),
          ])),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            nome,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    ),
  );
}
