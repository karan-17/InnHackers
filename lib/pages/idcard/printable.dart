import 'package:flutter/material.dart';
import 'package:innhacks/pages/idcard/save_btn.dart';

buildPrintableData(image) => Padding(
  padding: const EdgeInsets.all(25.00),
  child: Column(children: [
    const Text("vijaycreations",
        style:
        TextStyle(fontSize: 25.00, fontWeight: FontWeight.bold)),
    const SizedBox(height: 10.00),
    const Divider(),
    const Align(
      alignment: Alignment.topRight,
      child: Image(
        image: NetworkImage(
            "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_250,q_auto:good,w_250/v1/gcs/platform-data-dsc/events/karen_0W6Zqpq.PNG"),
        width: 250,
        height: 250,
      ),
    ),
    Column(
      children: [
       Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            SizedBox(width: 5.5),
            Text(
              "Invoice",
              style: TextStyle(
                  fontSize: 23.00, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(height: 10.00),
        Container(
          color: const Color.fromARGB(125, 255, 125, 155),
          width: double.infinity,
          height: 36.00,
          child: const Center(
            child: Text(
              "Approvals",
              style: TextStyle(
                  color: Color.fromARGB(55, 135, 55, 145),
                  fontSize: 20.00,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        for (var i = 0; i < 3; i++)
          Container(
            color: i % 2 != 0
                ? const Color.fromARGB(190, 190, 190, 140)
                : const Color.fromARGB(255, 255, 255, 25),
            width: double.infinity,
            height: 36.00,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  i == 2
                      ? const Text(
                    "Tax",
                    style: TextStyle(
                        fontSize: 18.00,
                        fontWeight: FontWeight.bold),
                  )
                      : Text(
                    "Item ${i + 1}",
                    style: const TextStyle(
                        fontSize: 18.00,
                        fontWeight: FontWeight.bold),
                  ),
                  i == 2
                      ? const Text(
                    "\$ 2.50",
                    style: TextStyle(
                        fontSize: 18.00,
                        fontWeight: FontWeight.normal),
                  )
                      : Text(
                    "\$ ${(i + 1) * 7}.00",
                    style: const TextStyle(
                        fontSize: 18.00,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            width: double.infinity,
            height: 36.00,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "\$ 23.50",
                  style: TextStyle(
                    fontSize: 22.00,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(125, 125, 125, 125),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15.00),
        const Text(
          "Thanks for choosing our service!",
          style: TextStyle(
              color: Color.fromARGB(125, 125, 125, 125), fontSize: 15.00),
        ),
        const SizedBox(height: 5.00),
        const Text(
          "Contact the branch for any clarifications.",
          style: TextStyle(
              color: Color.fromARGB(125, 125, 125, 125), fontSize: 15.00),
        ),
        const SizedBox(height: 15.00),
        const SaveBtnBuilder(),
      ],
    )
  ]),
);