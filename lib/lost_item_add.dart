import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

import 'services/database.dart';

class LostItemAdd extends StatefulWidget {
  const LostItemAdd({super.key});

  @override
  State<LostItemAdd> createState() => _LostItemState();
}

class _LostItemState extends State<LostItemAdd> {
  String selectedCategory = 'Laptop';
  TextEditingController customCategoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController colourController = TextEditingController();
  DateTime? selectedDate;
  TextEditingController emailController = TextEditingController();
  TextEditingController location1Controller = TextEditingController();
  TextEditingController location2Controller = TextEditingController();
  TextEditingController additionalInfoController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color.fromARGB(255, 109, 57, 199),
        foregroundColor: Colors.white,
        title: const Text(
          'Add lost item',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(25.0, 18, 25.0, 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select Category",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          isExpanded: true, // Make the dropdown take full width
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          value: selectedCategory,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCategory = newValue!;
                            });
                          },
                          items: ['Laptop', 'Phone', 'Wallet', 'Others']
                              .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      if (selectedCategory == 'Others')
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextField(
                              controller: customCategoryController,
                              decoration: const InputDecoration(
                                hintText: 'Enter category',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                    ],
                  )),
              const SizedBox(height: 10.0),
              const Text(
                "Brand",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: brandController,
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                "Colour",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: colourController,
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                "Lost Since",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 3.0,
              ),
              InkWell(
                onTap: () => _selectDate(context),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      selectedDate != null
                          ? Text(
                              "${selectedDate!.toLocal()}".split(' ')[0],
                            )
                          : const Text(
                              "Select Date",
                              style: TextStyle(color: Colors.grey),
                            ),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                "Might have lost at this location:",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: location1Controller,
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: location2Controller,
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                "Email to contact if item found:",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                "Additional information (optional)",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: additionalInfoController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0)),
                  maxLines: null,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 109, 57, 199)),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () async {
                      String id = randomAlphaNumeric(10);
                      Map<String, dynamic> itemMap = {
                        'Id': id,
                        'category': selectedCategory,
                        'customCategory': customCategoryController.text,
                        'brand': brandController.text,
                        'colour': colourController.text,
                        'lostSince': selectedDate?.toLocal(),
                        'location1': location1Controller.text,
                        'location2': location2Controller.text,
                        'contactEmail': emailController.text,
                        'additionalInfo': additionalInfoController.text,
                      };
                      await DatabaseMethods()
                          .addItems(itemMap, id)
                          .then((value) {
                        Fluttertoast.showToast(
                            msg: "Lost item added successfully !",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor:
                                const Color.fromARGB(255, 109, 57, 199),
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
