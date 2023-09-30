import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_carpool_app/view/sections/ride-booking/ride_booking_web.dart';

class PaymentScreenWeb extends StatefulWidget {
  PaymentScreenWeb({Key? key, this.payment}) : super(key: key);

  final double? payment;
  final List<String> banks = [
    "HBL",
    "EasyPaisa",
    "JazzCash",
    "Allied Bank",
    "UBL",
    "NayaPay",
    "SadaPay"
  ];

  @override
  State<PaymentScreenWeb> createState() => _PaymentScreenWebState();
}

class _PaymentScreenWebState extends State<PaymentScreenWeb> {
  String _value = "";
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _value = widget.banks[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      backgroundColor: Colors.pink.shade50,

      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Amount : ${widget.payment}",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.black)),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Select Bank:",
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: DropdownButton(
                        underline: const SizedBox(),
                        dropdownColor: Theme.of(context).primaryColor,
                        style: const TextStyle(color: Colors.black),
                        iconDisabledColor: Colors.white,
                        iconEnabledColor: Colors.yellow,
                        value: _value,
                        items: widget.banks.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Row(
                              children: [
                                Text(
                                  e,
                                  style: const TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        }),
                  ),
                ],
              ),
              _value != "EasyPaisa" && _value != "JazzCash"
                  ? Padding(
                      padding: const EdgeInsets.only(top: 48),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            padding: const EdgeInsets.only(left: 16),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Colors.white),
                            child: TextField(
                              controller: _controller2,
                              decoration: const InputDecoration(
                                hintText: "Name on Card",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            padding: const EdgeInsets.only(left: 16),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Colors.white),
                            child: TextField(
                              controller: _controller1,
                              decoration: const InputDecoration(
                                hintText: "Card Number",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.08,
                                padding: const EdgeInsets.only(left: 16),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: Colors.white),
                                child: TextField(
                                  controller: _controller3,
                                  decoration: const InputDecoration(
                                    label: Text("Expiry"),
                                    labelStyle: TextStyle(color: Colors.black),
                                    hintText: "8/25",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.08,
                                padding: const EdgeInsets.only(left: 16),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: Colors.white),
                                child: TextField(
                                  controller: _controller4,
                                  decoration: const InputDecoration(
                                    label: Text("CVV"),
                                    labelStyle: TextStyle(color: Colors.black),
                                    hintText: "XXX",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 64,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 36,
                                  vertical: 16,
                                ),
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                if (_controller1.text.isNotEmpty &&
                                    _controller2.text.isNotEmpty &&
                                    _controller3.text.isNotEmpty &&
                                    _controller4.text.isNotEmpty) {
                                  buildShowDialog(context);
                                }
                              },
                              child: const Text("Proceed")),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 48),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            padding: const EdgeInsets.only(left: 16),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Colors.white),
                            child: TextField(
                              controller: _controller1,
                              decoration: const InputDecoration(
                                hintText: "Enter account number or IBAN",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 64,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 36,
                                  vertical: 16,
                                ),
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                if (_controller1.text.isNotEmpty) {
                                  buildShowDialog(context);
                                }
                              },
                              child: const Text("Proceed")),
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4,
              sigmaY: 4,
            ),
            child: AlertDialog(
              title: const Text(
                "Payment Successful",
                textAlign: TextAlign.center,
              ),
              content: Text(
                "Amount: ${widget.payment} from account ${_controller1.text}",
                textAlign: TextAlign.center,
              ),
              alignment: Alignment.center,
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RideBookingWeb()));
                    },
                    child: const Text("Ok")),
              ],
            ),
          );
        });
  }
}
