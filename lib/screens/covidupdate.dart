import 'package:flutter/material.dart';
import 'package:pert/constants/colors.dart';
import 'package:pert/models/usermodel.dart';

enum SingingCharacter { Yes, No }

class CovidUpdate extends StatefulWidget {
  const CovidUpdate({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  State<CovidUpdate> createState() => _CovidUpdateState();
}

class _CovidUpdateState extends State<CovidUpdate> {
  String dropdownValue = 'Method1';
  @override
  void initState() {
    // TODO: implement initState

    widget.user.covidInfo ??= CovidInfo(
      method: 'Method1',
      question1: null,
      question2: null,
      question3: null,
      question4: null,
      result: false,
      vaccinated: false,
    );
    widget.user.covidInfo !=null ? widget.user.covidInfo!.method = 'Method1' : widget.user.covidInfo!.method = widget.user.covidInfo!.method;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 15.0,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Report Your Test Now !',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700, fontSize: 18.0),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
                  child: Text(
                    'Test Method',
                    style: TextStyle(color: kprimaryColor, fontSize: 17.5, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(

                            onChanged: (String? v) {
                              setState(() {
                                widget.user.covidInfo!.method = v!;
                              });
                            },
                            value: widget.user.covidInfo!.method,
                            items: const [
                              DropdownMenuItem<String>(
                                value: 'Method1',
                                child: Text('Test1'),
                              ),
                              DropdownMenuItem(
                                value: 'Method2',
                                child: Text('Test2'),
                              ),
                              DropdownMenuItem(
                                value: 'Method3',
                                child: Text('Test3'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
                  child: Text(
                    'Test Type',
                    style: TextStyle(color: kprimaryColor, fontSize: 17.5, fontWeight: FontWeight.bold),
                  ),
                ),
                RadioListTile<String>(
                    title: const Text('Type1'),
                    value: 'Type1',
                    groupValue: widget.user.covidInfo!.type,
                    onChanged: (String? val) {
                      setState(() {
                        widget.user.covidInfo!.type = val!;
                      });
                    }),
                RadioListTile<String>(
                    title: const Text('Type2'),
                    value: 'Type2',
                    groupValue: widget.user.covidInfo!.type,
                    onChanged: (String? val) {
                      setState(() {
                        widget.user.covidInfo!.type = val!;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
                  child: Text(
                    'Test Result',
                    style: TextStyle(color: kprimaryColor, fontSize: 17.5, fontWeight: FontWeight.bold),
                  ),
                ),
                RadioListTile<bool>(
                    title: const Text('Positive'),
                    value: true,
                    groupValue: widget.user.covidInfo!.result,
                    onChanged: (val) {
                      setState(() {
                        widget.user.covidInfo!.result = val!;
                      });
                    }),
                RadioListTile<bool>(
                    title: const Text('Negative'),
                    value: false,
                    groupValue: widget.user.covidInfo!.result,
                    onChanged: (val) {
                      setState(() {
                        widget.user.covidInfo!.result = val!;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
                  child: Text(
                    'Have your Shot',
                    style: TextStyle(color: kprimaryColor, fontSize: 17.5, fontWeight: FontWeight.bold),
                  ),
                ),
                RadioListTile<bool>(
                    title: const Text('Yes'),
                    value: true,
                    groupValue: widget.user.covidInfo!.vaccinated,
                    onChanged: (val) {
                      setState(() {
                        widget.user.covidInfo!.vaccinated = val!;
                      });
                    }),
                RadioListTile<bool>(
                    title: const Text('No'),
                    value: false,
                    groupValue: widget.user.covidInfo!.vaccinated,
                    onChanged: (val) {
                      setState(() {
                        widget.user.covidInfo!.vaccinated = val!;
                      });
                    }),
              ],
            )
          ],
        ),
      ),
    );

  }
}
