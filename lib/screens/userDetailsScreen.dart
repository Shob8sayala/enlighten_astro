import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:enlighten_astro/providers/moneyProvider.dart';
import 'package:enlighten_astro/providers/userProvider.dart';
import 'package:enlighten_astro/utils/appBar.dart';
import 'package:enlighten_astro/utils/bottomNavBar.dart';
import 'package:enlighten_astro/utils/preferences.dart';
import 'package:enlighten_astro/utils/sideDrawer.dart';
import 'package:enlighten_astro/widgets/customContainer.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});
  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  Widget customTextField(
      String text, TextEditingController controller, int type) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: type == 1
          ? ((input) => input!.isValidEmail() ? null : "Check your email")
          : ((input) => input!.length > 1 ? null : "Check the details"),
      cursorColor: Colors.black,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: Colors.white), //<-- SEE HERE
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.grey), //<-- SEE HERE
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: Colors.black12), //<-- SEE HERE
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red), //<-- SEE HERE
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: Colors.white), //<-- SEE HERE
          ),
          contentPadding:
              const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: text),
    );
  }

  Widget CustomDropDown(
      List<String> items, String? controller, String hint, int type) {
    return DropdownButtonFormField<String>(
      // value: controller,
      hint: Text(hint),
      items: items
          .map<DropdownMenuItem<String>>((String item) =>
              DropdownMenuItem<String>(child: Text(item), value: item))
          .toList(),
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.white), //<-- SEE HERE
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.grey), //<-- SEE HERE
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 2, color: Colors.black12), //<-- SEE HERE
        ),
        contentPadding:
            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
      ),
      value: controller,
      onChanged: (value) {
        setState(() {
          print("selected $value");
          if (type == 0) {
            gender = value!;
          } else if (type == 1) {
            country = value;
          } else {
            state = value;
          }
          print(country);
          if (country != "India") {
            stateList = ["Others"];
            state = "Others";
          } else {
            stateList = [
              "Delhi",
              "Uttar Pradesh",
              "Haryana",
              "Uttarakhand",
              "Rajasthan",
              "Others"
            ];
          }
        });
      },
    );
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController birthTimeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  String? gender;
  String? country;
  String? state;
  List<String> genderlist = const ["Male", "Female", "Others"];
  List<String> countryList = const [
    "India",
    "Pakistan",
    "China",
    "Bangladesh",
    "Nepal",
    "Others"
  ];
  List<String> stateList = const [
    "Delhi",
    "Uttar Pradesh",
    "Haryana",
    "Uttarakhand",
    "Rajasthan",
    "Others"
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: myAppBar(),
      ),
      bottomNavigationBar: myBottomNavBar(),
      drawer: SideDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Center(
            child: CustomContainerWdt(
              text: "SHARE YOUR DETAILS",
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: customTextField("Name", nameController, 0),
                  ),
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: CustomDropDown(genderlist, gender, "Gender", 0)),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: customTextField("Email", emailController, 1),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: customTextField("Date of Birth", dobController, 0),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child:
                        customTextField("Birth Time", birthTimeController, 0),
                  ),
                  Padding(
                      padding: EdgeInsets.all(8),
                      child:
                          CustomDropDown(countryList, country, "Country", 1)),
                  Padding(
                      padding: EdgeInsets.all(8),
                      child:
                          // (country == "India")
                          //     ?
                          CustomDropDown(stateList, state, "State", 2)
                      // : CustomDropDown(stateList.sublist(stateList.length - 1),
                      //     state, "State"),
                      ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: customTextField("City", cityController, 0),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: customTextField("Message", messageController, 0),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () {
                        if (emailController.text.isValidEmail() &&
                            nameController.text.length > 1 &&
                            dobController.text.length > 1 &&
                            birthTimeController.text.length > 1 &&
                            cityController.text.length > 1) {
                          Provider.of<MoneyProvider>(context, listen: false)
                              .addMoney(-1 *
                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .fees);
                          Provider.of<UserProvider>(context, listen: false)
                              .setFees(0);
                          Preferences.setInt(
                              "money",
                              Provider.of<MoneyProvider>(context, listen: false)
                                  .money);
                          context.go('/consultancyConformation');
                        }
                      },
                      child: const Text("SUBMIT"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
