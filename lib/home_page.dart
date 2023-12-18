import 'package:choose_n_fly/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final MainPageController mainPageController = Get.put(MainPageController());
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const Text('Rooms'),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          hint: const Text('Select rooms'),
                          value: mainPageController.selectedRoom.value == 0
                              ? null
                              : mainPageController.selectedRoom.value,
                          onChanged: (int? newValue) {
                            if (newValue != null) {
                              mainPageController.selectedRoom.value = newValue;
                            }
                          },
                          items: List.generate(
                            4,
                            (index) => DropdownMenuItem<int>(
                              value: index + 1,
                              child: Text(
                                (index + 1).toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: mainPageController.selectedRoom.value,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Obx(() {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<int>(
                                                hint:
                                                    const Text('Select Adult'),
                                                value: mainPageController
                                                            .selectedAdult
                                                            .value ==
                                                        0
                                                    ? null
                                                    : mainPageController
                                                        .selectedAdult.value,
                                                onChanged: (int? newValue) {
                                                  if (newValue != null) {
                                                    mainPageController
                                                        .selectedAdult
                                                        .value = newValue;
                                                  }
                                                },
                                                items: List.generate(
                                                  9,
                                                  (index) =>
                                                      DropdownMenuItem<int>(
                                                    value: index + 1,
                                                    child: Text(
                                                      (index + 1).toString(),
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                      Container(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Obx(() {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<int>(
                                                hint:
                                                    const Text('Select child'),
                                                value: mainPageController
                                                            .selectedChild
                                                            .isEmpty
                                                        
                                                    ? null
                                                    : mainPageController
                                                        .selectedChild[index],
                                                onChanged: (
                                                  int? newValue,
                                                ) {

                                                 
                                              mainPageController.currentInde.value = index;
                                                  print(index);
                                                 mainPageController.selectedChild.add(newValue);
                                                 mainPageController.selectedChildcoumt.value =newValue!;
                                                 print( 'selsected${mainPageController.selectedChild[index]}');
                                                },
                                                items: List.generate(
                                                  5,
                                                  (index) =>
                                                      DropdownMenuItem<int>(
                                                    value: index + 1,
                                                    child: Text(
                                                      (index + 1).toString(),
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                  Obx(() {
                                    print(mainPageController.currentInde.value);
                                    print('ind.. $index');
                                    return SingleChildScrollView(
                                      
                                      child:  mainPageController.currentInde.value != index
                                          ? const SizedBox()
                                          : GridView.builder(
                                              itemCount: mainPageController
                                                  .selectedChildcoumt.value,
                                              shrinkWrap: true,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      childAspectRatio: 1.2,
                                                      crossAxisCount: 5),
                                              itemBuilder: (context, index) {
                                                return  Padding(

                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.75,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // print('index $index');
                                                      },
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        decoration:
                                                            const InputDecoration(
                                                          hintText: 'age',
                                                          contentPadding:
                                                              EdgeInsets.all(8),
                                                          border:
                                                              OutlineInputBorder(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                    );
                                  })
                                ],
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
