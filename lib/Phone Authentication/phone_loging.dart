import 'package:country_pickers/country.dart';
import 'package:fire_data/Phone%20Authentication/page_otp.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';

class PhoneAuthWithFire extends StatelessWidget {
  static const String title = 'Phone Authentication';

  const PhoneAuthWithFire({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'Phone',
      routes: {
        'Phone': (context) => const LoginWithPhone(),
        'OTP' :(context) => const MyOtp()
      },
      title: title,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const LoginWithPhone(),
    );
  }
}

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/CellNumber_Verify.png',
                width: 220,
                height: 220,
              ),
              const SizedBox(height: 12),
              const Text(
                'Phone Verification',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Text(
                'We need to register your phone before getting started !',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 45),
              Container(
                height: 65,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: CountryPickerDropdown(
                          initialValue: 'bd',
                          itemBuilder: _buildDropdownItem,
                          onValuePicked: (Country country) {
                            print("${country.name}");
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone Number",
                        ),
                        onChanged: (value) {
                          // this.phoneNo=value;
                          print(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  primary: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "OTP");
                },
                child: const Text('Get Code')
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            const SizedBox(
              width: 8.0,
            ),
            Text("+${country.phoneCode}(${country.isoCode})"),
          ],
        ),
      );
}
