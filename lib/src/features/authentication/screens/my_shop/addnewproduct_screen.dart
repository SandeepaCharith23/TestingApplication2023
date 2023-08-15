import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseapp2023/src/features/authentication/models/product.dart';
import 'package:ecommerseapp2023/src/repository/product_repository/product_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

import '../../../../constants/text_style.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final formkeyaddnewproduct = GlobalKey<FormState>();
  final controllers = Get.put(ProductController());
  XFile? pickedImageFile;
  late String customProductId;

  String generateCustomID(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    customProductId =
        '${dateTime.year}${dateTime.month}${dateTime.day}${dateTime.hour}${dateTime.minute}${dateTime.second}';
    return customProductId;
  }

  // final TextEditingController titleTextController;
  @override
  Widget build(BuildContext context) {
    //TextEditingController controller1;
    final List<String> productCategories = [
      "Plants",
      "Flowers",
      "Fruits",
      "Pets",
      "Others"
    ];
    String? selectedItem = productCategories.first;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new product to your shop"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formkeyaddnewproduct,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //1.Product Title
                  const Text(
                    "First select a Suitable topic for your product,this will display as a Heading in your product",
                    style: pagetextFieldStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controllers.productTitleController,
                      style: pagetextFieldStyle,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a Valid Title for your product";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Plants for decorations",
                        label: Text(
                          "Please use 5-6 words",
                        ),
                      ),
                    ),
                  ),
                  //2.Product Category-Selection
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "select product catergory",
                        style: pagetextFieldStyle,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: selectedItem, // The currently selected item
                          dropdownColor: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(20.0),
                          isExpanded: true,
                          validator: (value) {
                            if (value == null) {
                              return 'Please select an option.';
                            }
                            // Add more validation logic here if needed
                            return null; // Return null if the value is valid
                          },

                          onChanged: (String? newValue) {
                            setState(() {
                              selectedItem =
                                  newValue; // Update the selected item when a new item is selected

                              if (kDebugMode) {
                                print(selectedItem);
                              }
                            });
                          },
                          items:
                              productCategories.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: pagetextFieldStyle,
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ),

                  //3.Product Name
                  const Text(
                    "Please Insert Product Name",
                    style: pagetextFieldStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controllers.productNameController,
                      style: pagetextFieldStyle,
                      decoration: const InputDecoration(
                        hintText: "Anthurium-Anthurium andraeanum",
                        label: Text(
                          "Please use Common name or Scientific name",
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a Valid product name";
                        }
                        return null;
                      },
                    ),
                  ),

                  //3.Product Description
                  const Text(
                    "Please Insert Product Description",
                    style: pagetextFieldStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controllers.productDescriptionController,
                      style: pagetextFieldStyle,
                      decoration: const InputDecoration(
                        hintText: "this plants is used for etc...",
                        label: Text(
                          "Please use breief description on your product",
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a Description to your product";
                        }
                        return null;
                      },
                    ),
                  ),

                  //product unit price
                  const Text(
                    "Please Insert Product Unit Price",
                    style: pagetextFieldStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controllers.productPriceController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^(\d+)?\.?\d{0,2}'))
                      ],
                      style: pagetextFieldStyle,
                      decoration: const InputDecoration(
                        hintText: "100.00",
                        label: Text(
                          "Unit Price",
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a Valid product name";
                        }
                        return null;
                      },
                    ),
                  ),

                  //Available product quentity
                  const Text(
                    "Please Insert Available product quentity",
                    style: pagetextFieldStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controllers.productQuentityController,
                      style: pagetextFieldStyle,
                      decoration: const InputDecoration(
                        hintText: "100.00",
                        label: Text(
                          "Available product Quntity",
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a Valid product name";
                        }
                        return null;
                      },
                    ),
                  ),

                  //Drop Images -or used camera
                  const Text(
                    "Please Insert Images of your product",
                    style: pagetextFieldStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      // Show a dialog or use a button to prompt the user to choose between gallery or camera
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Select Image Source'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                _pickImage(ImageSource.camera);
                              },
                              child: const Text('Camera'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                _pickImage(ImageSource.gallery);
                                setState(() {});
                              },
                              child: const Text('Gallery'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Select Image'),
                  ),
                  // Center(
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: Container(
                  //           width: 100,
                  //           height: 100,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             color: Colors.white,
                  //             boxShadow: [
                  //               BoxShadow(
                  //                   offset: const Offset(0, 3),
                  //                   blurRadius: 7,
                  //                   spreadRadius: 3.0,
                  //                   color: Colors.grey.withOpacity(0.5)),
                  //             ],
                  //           ),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               IconButton(
                  //                 onPressed: () {},
                  //                 icon: Image.asset(
                  //                   'assets/icons/icons-chat-64.png',
                  //                   fit: BoxFit.fill,
                  //                 ),
                  //               ),
                  //               const Text(
                  //                 'Gallery',
                  //                 style: TextStyle(
                  //                   fontSize: 10,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(
                  //         width: 10,
                  //       ),
                  //       /////////////////////

                  //       ////////////////

                  //       Expanded(
                  //         child: Container(
                  //           width: 100,
                  //           height: 100,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             color: Colors.white,
                  //             boxShadow: [
                  //               BoxShadow(
                  //                   offset: const Offset(0, 3),
                  //                   blurRadius: 7,
                  //                   spreadRadius: 3.0,
                  //                   color: Colors.grey.withOpacity(0.5)),
                  //             ],
                  //           ),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               IconButton(
                  //                 onPressed: () {
                  //                   // Navigator.of(context).push(
                  //                   //     MaterialPageRoute(builder: (context) {
                  //                   //   return const MarketPlaceScreen();
                  //                   // }));

                  //                   //Get.to(() => const MarketPlaceScreen());
                  //                 },
                  //                 icon: Image.asset(
                  //                   'assets/icons/icons-market-64.png',
                  //                   fit: BoxFit.fill,
                  //                 ),
                  //               ),
                  //               const Text(
                  //                 'Camera',
                  //                 style: TextStyle(
                  //                   fontSize: 10,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(
                  //         width: 10,
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkeyaddnewproduct.currentState!.validate()) {
                          if (kDebugMode) {
                            print("Done");

                            final product = Product(
                              image: pickedImageFile.toString(),
                              title: controllers.productTitleController.text
                                  .toUpperCase(),
                              description: controllers
                                  .productDescriptionController.text
                                  .toUpperCase(),
                              productName: controllers
                                  .productNameController.text
                                  .toUpperCase(),
                              productOwnersname: controllers
                                  .productOwnerNameController.text
                                  .toUpperCase(),
                              price: double.parse(
                                  controllers.productPriceController.text),
                              size: double.parse(
                                  controllers.productQuentityController.text),
                              id: generateCustomID(Timestamp.now()),
                              color: Colors.black,
                              productCategory: selectedItem.toString(),
                            );

                            // Timestamp timestamp = Timestamp.now();
                            // String customId = generateCustomID(timestamp);
                            ProductController.instance
                                .addNewProduct(customProductId, product);
                          }
                        }
                      },
                      child: const Text("Save Product"),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        // Handle the selected/captured image here
        pickedImageFile = XFile(pickedFile.path);
      }
    });
  }
}
