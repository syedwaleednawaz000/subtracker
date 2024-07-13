import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/login/login_screen.dart';
import '../base/text_widgets.dart';



class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  bool val = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF1C1C23),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/new.png'), fit: BoxFit.cover)
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 250,),
                    const Text( 'Reset Password',
                      style: TextStyle(
                          fontFamily: 'Poppins_Regular',
                        fontSize: 26,
                        color: Colors.white
                      ),
              
                    ),
                    const SizedBox(height: 16,),
                    const Text( 'Here’s a tip: Use a combination of numbers,'
                        ' \nuppercase, lowercase and special characters',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Poppins_Regular',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
              
                    ),
              
                    const SizedBox(height: 28,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Password',
                        style: TextStyle(
                          // fontFamily: 'Poppins_Regular',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0XFF666680),
                        ),
                        ),
              
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          style: TextStyle(
                              color:  Color(0XFF666680)
                          ),
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.only(left: 20, right: 20),
                              hintText: 'Password',
                            hintStyle:  TextStyle(
                              fontFamily: 'Poppins_Regular',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0XFF666680).withOpacity(.3),
                            ),
                              suffixIcon: Icon(Icons.lock, color: const Color(0XFF666680).withOpacity(.3),),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2))),
                              focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2)),
                        ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2))),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),
              
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text( 'Confirm Password',
                          style: TextStyle(
                            // fontWeight: FontWeight.w400,
                            // fontFamily: 'Poppins_Regular',
                            fontSize: 12,
                            color: Color(0XFF666680),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          style: TextStyle(
                              color:  Color(0XFF666680)
                          ),
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.only(left: 20, right: 20),
                              hintText: 'Confirm Password',
                            hintStyle:  TextStyle(
                              fontFamily: 'Poppins_Regular',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0XFF666680).withOpacity(.3),
                            ),
                              suffixIcon: Icon(Icons.lock , color: const Color(0XFF666680).withOpacity(.3),),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2))),
                              focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2)),
                        ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2)),
                          ),
                          ),  ),
                      ],
                    ),
              
                  ],
                ),
              ),
              const SizedBox(height: 28,),
              GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                child: Container(
                  height: 50, width: 325,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    // border: Border.all(color: Colors.white.withOpacity(.5)),
                    border: Border(
                        top: BorderSide(color: Colors.white.withOpacity(.5)),
                        left: BorderSide(color: Colors.white.withOpacity(.5)),
                        // right: BorderSide(color: Colors.white.withOpacity(.5)),
                        bottom: BorderSide.none
                    ),
                    color: const Color(0XFF758AFF),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 8),
                          blurRadius: 25,
                          color: const Color(0XFF4F63BE).withOpacity(.5)
                      )
                    ],/*Secondary Color*/
                  ),
                  child: const Center(
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
