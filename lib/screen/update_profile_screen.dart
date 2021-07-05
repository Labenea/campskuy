import 'package:campskuy/bloc/auth_bloc.dart';
import 'package:campskuy/screen/home_screen.dart';
import 'package:campskuy/utils/color_utils.dart';
import 'package:campskuy/widget/logo_button.dart';
import 'package:campskuy/widget/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _birthController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  List<String> genders = ["Male", "Female"];
  String genderVal = "Male";
  DateTime? selectedDate;

  AuthBloc authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocListener(
          bloc: authBloc,
          listener: (context, state) {
            if (state is AuthLoginSuccess) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            } else if (state is AuthLoginFailed) {
              _showMyDialog();
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        "images/camp.png",
                        height: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        "Complete your profile",
                        style: TextStyle(
                            fontSize: 28,
                            color: ColorsUtil.primaryGreen,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: ColorsUtil.accentGreen,
                                ),
                                hintText: "Full name",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorsUtil.accentGreen),
                                )),
                            cursorColor: ColorsUtil.accentGreen,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: TextField(
                              controller: _birthController,
                              decoration: InputDecoration(
                                  hintText: "Date of birth",
                                  prefixIcon: Icon(
                                    Icons.calendar_today,
                                    color: ColorsUtil.accentGreen,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorsUtil.accentGreen),
                                  )),
                              enabled: false,
                              cursorColor: ColorsUtil.accentGreen,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 55,
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: genderVal,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                              underline: Container(
                                height: 1,
                                color: Colors.grey[500],
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  genderVal = newValue!;
                                });
                              },
                              items: genders.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: <Widget>[
                                        getIcon(),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          value,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          TextField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: ColorsUtil.accentGreen,
                                ),
                                hintText: "Phone number",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorsUtil.accentGreen),
                                )),
                            cursorColor: ColorsUtil.accentGreen,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: MainButton(
                              title: "Confirm",
                              onTap: () {
                                authBloc.add(CompleteProfile(
                                    _nameController.text,
                                    selectedDate,
                                    genderVal,
                                    _phoneController.text));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getIcon() {
    if (genderVal == "Male") {
      return Icon(
        Icons.male,
        color: ColorsUtil.accentGreen,
      );
    } else {
      return Icon(Icons.female, color: ColorsUtil.accentGreen);
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Refer step 1
      firstDate: DateTime(1500),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        _birthController.text = DateFormat("dd MMMM yyyy").format(picked);
        selectedDate = picked;
      });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Failed'),
          content: SingleChildScrollView(
            child: Text('All field must be filled'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
