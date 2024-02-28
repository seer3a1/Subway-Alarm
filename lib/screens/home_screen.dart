import 'package:flutter/material.dart';
import 'package:subway/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> SubwayStations = [
  '지하철1',
  '지하철2',
  '지하철3',
  '지하철4',
  '지하철5',
  '지하철6',
  '지하철7',
  '지하철8',
  '지하철9',
];

final _formKey = GlobalKey<FormState>();

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController departureController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  bool showSubwayList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Subway alarm',
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).cardColor,
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          '출발역 :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 58,
                          child: TextFormField(
                            controller: departureController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '출발역을 입력하지 않았습니다.';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: '출발역을 입력해주세요.',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          '도착역 :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 58,
                          child: TextFormField(
                            controller: destinationController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '도착역을 입력하지 않았습니다.';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: '도착역을 입력해주세요.',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            showSubwayList = !showSubwayList;
                          });
                        }
                      },
                      child: const Icon(
                        Icons.done,
                        color: Colors.green,
                        size: 60,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: showSubwayList,
                child: Subway_List(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Subway_List extends StatelessWidget {
  const Subway_List({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: SubwayStations.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen()));
            },
            child: Card(
              elevation: 5,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      SubwayStations[index],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
