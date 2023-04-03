import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedValue = 0;
  double _sliderValue = 0.0;
  int _counter = 0;
  bool _switch = false;
  TextEditingController controller = TextEditingController();

  String _textFieldVal = "";

  TextStyle style =  TextStyle(color: Colors.black, fontSize: 20);

  // ignore: prefer_final_fields
  Map<int, Widget> _segment = <int, Widget>{
    0: const SizedBox(
        height: 50, width: 100, child: Center(child: Text("Red", ))),
    1: const SizedBox(
        height: 50, width: 100, child: Center(child: Text("Blue"))),
  };

  Widget _introWidget(double width) {
    return SizedBox(
      height: 70,
      width: width,
      child: Center(
        child: Column(
          children:  [
            Text("Assignment 3", style: style,),
            Text("Avinash Korat", style: style,),
            Text("A00126928", style: style,),
          ],
        ),
      ),
    );
  }

  Widget _showData(double width) {
    return SizedBox(
      height: 70,
      width: width,
      child: Center(
        child: Text("MAD 415", style: style,),
      ),
    );
  }

  TableRow _nameAndImageWidget() {
    return TableRow(
      children: [
        Center(child: Text("Avinash ", style: style,)),
        const Center(
          child: CircleAvatar(
            backgroundImage: ExactAssetImage('assets/minion.jpeg'),
            backgroundColor: Colors.red,
          ),
        )
      ],
    );
  }

  TableRow _listTile2() {
    return TableRow(
      children: [
        Center(
          child: CupertinoSegmentedControl<int>(
            children: _segment,
            onValueChanged: (value) {
              selectedValue = value;
              setState(() {});
            },
            selectedColor: CupertinoColors.black,
            unselectedColor: CupertinoColors.white,
            borderColor: CupertinoColors.inactiveGray,
            pressedColor: CupertinoColors.inactiveGray,
            groupValue: selectedValue,
          ),
        ),
        Center(child: _segment[selectedValue]!)
      ],
    );
  }

  TableRow _listTile3(double width) {
    return TableRow(
      children: [
        Center(
          child: SizedBox(
            width: width / 1.5,
            child: const LinearProgressIndicator(
              color: Colors.blue,
              minHeight: 10,
              value: 0.5,
            ),
          ),
        ),
       Center(child: Text("50", style: style,))
      ],
    );
  }

  TableRow _listTile4() {
    return TableRow(
      children: [
        Center(
          child: CupertinoSlider(
              value: _sliderValue,
              min: 0,
              max: 100,
              onChanged: (double val) {
                setState(() {
                  _sliderValue = val;
                });
              }),
        ),
        Center(child: Text(_sliderValue.toInt().toString(), style: style,))
      ],
    );
  }

  TableRow _listTile5() {
    return TableRow(
      children: [
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: CupertinoButton(
                    color: Colors.black,
                    child: const Center(
                        child: Text(
                      "+",
                      style: TextStyle(color: Colors.white),
                    )),
                    onPressed: () {
                      setState(() {
                        _counter++;
                      });
                    }),
              ),
              Expanded(
                child: CupertinoButton(
                    color: Colors.black,
                    child: const Center(
                        child: Text(
                      "-",
                      style: TextStyle(color: Colors.white),
                    )),
                    onPressed: () {
                      setState(() {
                        _counter--;
                      });
                    }),
              )
            ],
          ),
        ),
        Center(
            child: SizedBox(
                width: 50, child: Center(child: Text(_counter.toString(), style: style,))))
      ],
    );
  }

  TableRow _listTile6() {
    return TableRow(
      children: [
        Center(
          child: CupertinoSwitch(
              value: _switch,
              onChanged: (value) {
                setState(() {
                  _switch = value;
                });
              }),
        ),
        Center(child: Text(_switch ? "On" : "Off", style: style,))
      ],
    );
  }

  TableRow _listTile7() {
    return TableRow(
      children: [
        Center(
          child: CupertinoTextField(
            controller: controller,
            onChanged: (value) {
              setState(() {
                _textFieldVal = value;
              });
            },
          ),
        ),
        Center(child: Text(_textFieldVal, style: style,))
      ],
    );
  }

  TableRow _spacingWidget() {
    return const TableRow(
      children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double widthh = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
            height: double.maxFinite,
            width: widthh,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                _introWidget(widthh),
                _showData(widthh),
                Padding(
                  padding: const EdgeInsets.all(8.0),

                  // Table widget defined here
                  child: Table(
                    children: [
                      _spacingWidget(),
                      _nameAndImageWidget(),
                      _spacingWidget(),
                      _listTile2(),
                      _spacingWidget(),
                      _listTile3(widthh),
                      _spacingWidget(),
                      _listTile4(),
                      _spacingWidget(),
                      _listTile5(),
                      _spacingWidget(),
                      _listTile6(),
                      _spacingWidget(),
                      _listTile7()
                    ],
                  ),
                ),
              ],
            )),
      )),
    );
  }
}
