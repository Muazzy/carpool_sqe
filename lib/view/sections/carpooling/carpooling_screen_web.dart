import 'package:flutter/material.dart';
import 'package:flutter_carpool_app/model/data/dummy_data.dart';
import 'package:flutter_carpool_app/view/sections/payment/payment_screen_web.dart';

class CarpoolingScreenWeb extends StatelessWidget {
  const CarpoolingScreenWeb(
      {Key? key, required this.location, required this.fare})
      : super(key: key);

  final String location;
  final String fare;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      backgroundColor: Colors.pink.shade50,
      floatingActionButton: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 10,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
        ),
        // iconSize: 40,
        label: const Text(
          "Skip",
          style: TextStyle(fontSize: 16),
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PaymentScreenWeb(
                        payment: double.parse(fare),
                      )));
        },
        icon: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 68,
                  horizontal: MediaQuery.of(context).size.width * 0.3),
              child: ListView.builder(
                  itemCount: DummyData.carpoolingUsers[location].length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                            DummyData.carpoolingUsers[location][index]['name']),
                        subtitle: Text(
                          "${DummyData.carpoolingUsers[location][index]['gender']}, ${DummyData.carpoolingUsers[location][index]['Age']} Y/O",
                        ),
                        // lea: Text(
                        //     "Age: ${DummyData.carpoolingUsers[location][index]['Age']}"),
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
                              double payment = double.parse(fare) / 2;
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentScreenWeb(
                                            payment: payment,
                                          )));
                            },
                            child: const Text("Share Ride")),
                      ),
                    );
                  }),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 48),
          //   child: ElevatedButton(
          //       onPressed: () {
          //         Navigator.pushReplacement(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => PaymentScreenWeb(
          //                       payment: double.parse(fare),
          //                     )));
          //       },
          //       child: const Text("Skip")),
          // ),
        ],
      ),
    );
  }
}
