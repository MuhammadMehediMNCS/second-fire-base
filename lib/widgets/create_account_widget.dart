import 'package:flutter/material.dart';
import 'InputDeco_design.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  late String name,email,phone;

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  child: Image.network("https://protocoderspoint.com/wp-content/uploads/2020/10/PROTO-CODERS-POINT-LOGO-water-mark-.png"),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person,"Full Name"),
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (value){
                      name = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.email,"Email"),
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Please a Enter';
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                    onSaved: (value){
                      email = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:buildInputDecoration(Icons.phone,"Phone No"),
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Please enter phone no ';
                      }
                      return null;
                    },
                    onSaved: (value){
                      phone = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: password,
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.lock,"Password"),
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Please a Enter Password';
                      }
                      return null;
                    },

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: confirmpassword,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.lock,"Confirm Password"),
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Please re-enter password';
                      }
                      print(password.text);

                      print(confirmpassword.text);

                      if(password.text!=confirmpassword.text){
                        return "Password does not match";
                      }

                      return null;
                    },

                  ),
                ),

                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextButton(
                    onPressed: (){

                      if(_formkey.currentState!.validate())
                      {
                        print("successful");

                        return;
                      }else{
                        print("UnSuccessfull");
                      }
                    },
                    child: Text("Submit"),

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}