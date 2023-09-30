import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_carpool_app/model/data/dummy_data.dart';

import '../carpooling/carpooling_screen_web.dart';

class RideBookingWeb extends StatefulWidget {
  const RideBookingWeb({Key? key}) : super(key: key);

  @override
  State<RideBookingWeb> createState() => _RideBookingWebState();
}

class _RideBookingWebState extends State<RideBookingWeb> {
  final _controller = TextEditingController();
  List<dynamic> rides = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        child: IconButton(
          iconSize: 40,
          onPressed: () {
            DummyData.rides.forEach((key, value) {
              if (key == _controller.text.toLowerCase()) {
                rides.addAll(value);
              } else if (!DummyData.rides
                  .containsKey(_controller.text.toLowerCase())) {
                rides = [];
              }
            });
            setState(() {});
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // backgroundColor: Theme.of(context).primaryColor.wit,
      backgroundColor: Colors.pink.shade50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Center(
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 10),
                width: MediaQuery.of(context).size.width * 0.3,
                height: 48,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                      hintText: "Input Location Ex: Karachi",
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
          if (rides.isNotEmpty)
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: ListView.builder(
                    itemCount: rides.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        child: ListTile(
                          isThreeLine: false,
                          title:
                              Text("Location: ${rides[index]["end_location"]}"),
                          subtitle:
                              Text("From: ${rides[index]["start_location"]}"),
                          trailing: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 10,
                              ),
                              backgroundColor: Colors.red.shade100,
                              foregroundColor: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 4,
                                        sigmaY: 4,
                                      ),
                                      child: AlertDialog(
                                        title: const Text(
                                          "Fare",
                                          textAlign: TextAlign.center,
                                        ),
                                        content: Text(
                                          rides[index]["fare"] + " PKR",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        actionsAlignment:
                                            MainAxisAlignment.center,
                                        actions: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: const StadiumBorder(),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 24,
                                                vertical: 10,
                                              ),
                                              backgroundColor:
                                                  Colors.red.shade100,
                                              foregroundColor: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("cancel"),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: const StadiumBorder(),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 24,
                                                vertical: 10,
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CarpoolingScreenWeb(
                                                            location: _controller
                                                                .text
                                                                .toLowerCase(),
                                                            fare: rides[index]
                                                                ["fare"],
                                                          )));
                                            },
                                            child: const Text(
                                              "Book",
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: const Text("Book"),
                          ),
                          leading: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Vehicle id: ${rides[index]["vehicle_id"]}"),
                              const SizedBox(
                                height: 4,
                              ),
                              Text("Rider name: ${rides[index]["rider_name"]}"),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                  "Vehicle type: ${rides[index]["vehicle_type"]}")
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 32),
          //   child: ElevatedButton(
          //       onPressed: () {
          //         DummyData.rides.forEach((key, value) {
          //           if (key == _controller.text.toLowerCase()) {
          //             rides.addAll(value);
          //           } else if (!DummyData.rides
          //               .containsKey(_controller.text.toLowerCase())) {
          //             rides = [];
          //           }
          //         });
          //         setState(() {});
          //       },
          //       child: const Text("Search")),
          // ),
        ],
      ),
    );
  }
}
