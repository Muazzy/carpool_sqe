import 'package:flutter/material.dart';
import 'package:flutter_carpool_app/view/sections/ride-booking/ride_booking_web.dart';

import '../../../model/authentication/auth.dart';

class LoginScreenWeb extends StatefulWidget {
  const LoginScreenWeb({Key? key}) : super(key: key);

  @override
  State<LoginScreenWeb> createState() => _LoginScreenWebState();
}

class _LoginScreenWebState extends State<LoginScreenWeb> {
  bool _discoverPassword = false;
  String _email = "";
  String _password = "";
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  bool _signUp = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            // backgroundColor: Colors.black,
            body: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/taxi.png",
                      width: 200,
                      height: 200,
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 48,
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24))),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Email", border: InputBorder.none),
                          onChanged: (value) {
                            _email = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please input Email";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 16, right: 10),
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 48,
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24))),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.23,
                            child: TextFormField(
                              obscureText: !_discoverPassword,
                              decoration: const InputDecoration(
                                  hintText: "Password",
                                  border: InputBorder.none),
                              onChanged: (value) {
                                _password = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please input Password";
                                }
                                return null;
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _discoverPassword = !_discoverPassword;
                              });
                            },
                            icon: Icon(
                              _discoverPassword
                                  ? Icons.panorama_fish_eye
                                  : Icons.remove_red_eye_rounded,
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.23,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // fixedSize: Size(100, 40),
                          padding: const EdgeInsets.symmetric(
                            // horizontal: 48,
                            vertical: 16,
                          ),
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });
                            if (_signUp) {
                              await registerWithUsernameAndPassword(
                                      _email, _password)
                                  .then((value) {
                                _isLoading = false;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RideBookingWeb()));
                              });
                            } else {
                              await loginWithUsernameAndPassword(
                                      _email, _password)
                                  .then((value) {
                                _isLoading = false;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RideBookingWeb()));
                              });
                            }
                          }
                        },
                        child: Text(
                          _signUp ? "Register" : "Login",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (!_signUp)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have account?",
                            // style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  _signUp = !_signUp;
                                });
                              },
                              child: const Text("Register")),
                        ],
                      ),
                    if (_signUp)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have account?",
                            // style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  _signUp = !_signUp;
                                });
                              },
                              child: const Text("Login")),
                        ],
                      )
                  ],
                )),
          );
  }
}
