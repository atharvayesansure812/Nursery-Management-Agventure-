import 'package:flutter/material.dart';

class DropButton extends StatefulWidget {
  @override
  _DropButtonState createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  var data = {
    "Jalgaon": ["Pachora", "Chalisgaon", "Jamner"],
    "Raigad": ["Uran", "panvel", "Mahad"],
  };

  List<String> district = [
    'Ahmednagar',
    'Akola',
    'Amravati',
    'Aurangabad',
    'Bhandara',
    'Beed',
    'Buldhana',
    'Chandrapur',
    'Dhule',
    'Gadchiroli',
    'Gondia',
    'Hingoli',
    'Jalgaon',
    'Jalna',
    'Kolhapur',
    'Latur',
    'Mumbai City',
    'Mumbai suburban',
    'Nandurbar',
    'Nanded',
    'Nagpur',
    'Nashik',
    'Osmanabad',
    'Parbhani',
    'Pune',
    'Raigad',
    'Ratnagiri',
    'Sindhudurg',
    'Sangli',
    'Solapur',
    'Satara',
    'Thane',
    'Wardha',
    'Washim',
    'Yavatmal',
  ];
  var selectedDistrcict;
  var selectedcity;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(height: 25),
            Image(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuFIHbqYbyIZGb9XYZxwHWeXRM__7Dodn14A&usqp=CAU")),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.deepPurpleAccent, width: 3),
                  borderRadius: BorderRadius.circular(20)),
              child: DropdownButton(
                dropdownColor: Colors.white,
                elevation: 20,
                value: selectedDistrcict,
                hint: Text(
                  "Enter Your Location",
                ),
                icon: Icon(
                  Icons.arrow_drop_down_circle_sharp,
                  size: 30,
                ),
                isExpanded: true,
                style: TextStyle(fontSize: 17, color: Colors.white),
                items: district.map((dropDownStringItem) {
                  return DropdownMenuItem(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (newValueSelected) {
                  setState(() {
                    selectedDistrcict = newValueSelected;
                  });
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.deepPurpleAccent, width: 2),
                  borderRadius: BorderRadius.circular(20)),
              child: DropdownButton(
                  dropdownColor: Colors.amber,
                  elevation: 20,
                  value: selectedcity,
                  hint: Text(
                    "Enter Your City",
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle_sharp,
                    size: 30,
                  ),
                  isExpanded: true,
                  style: TextStyle(fontSize: 17, color: Colors.black),
                  items: district.map((dropDownStringItem) {
                    return DropdownMenuItem(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (newValueSelected) {
                    setState(() {
                      selectedcity = newValueSelected;
                    });
                  }),
            ),
            SizedBox(height: 15),
            Text("Search via"),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                setState(() {});

                Navigator.pushNamed(context, '/Nursery');
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 0),
                width: 250,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  "Nurseries",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text("OR"),
            SizedBox(
              height: 3,
            ),
            InkWell(
              onTap: () {
                setState(() {});

                Navigator.pushNamed(context, '/plant');
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 0),
                width: 250,
                height: 55,
                alignment: Alignment.center,
                child: Text(
                  " Plants",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//  items: (selectedDistrict != null)
//                   ? data[selectedDistrict]
//                   : ["Select the district first"]
//                       .map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//               onChanged: (newValueSelected) {
//                 setState(() {
//                   selectedcity = newValueSelected;
//                 });