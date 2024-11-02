import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _firstNumTEController = TextEditingController();
  final TextEditingController _secondNumTEController = TextEditingController();
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  double _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: _firstNumTEController,
                keyboardType: TextInputType.number,
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return 'Enter a value';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'First number',
                  labelText: 'First number',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _secondNumTEController,
                keyboardType: TextInputType.number,
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return 'Enter a value';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Second number',
                  labelText: 'Second number',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              _buildButtonBar(),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Result: ${_result.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonBar() {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: _onTapAddButton, icon: Icon(Icons.add)),
        IconButton(onPressed: _onTapMinusButton, icon: Icon(Icons.remove)),
        TextButton(
            onPressed: _onTapMultiplyButton,
            child: const Text(
              '*',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            )),
        TextButton(
            onPressed: _onTapDivisionButton,
            child: const Text(
              '/',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            )),
      ],
    );
  }

  void _onTapAddButton() {
    if (_formkey.currentState!.validate()){
      double firstNum = double.tryParse(_firstNumTEController.text) ?? 0;
      double secondNum = double.tryParse(_secondNumTEController.text) ?? 0;
      _result = firstNum + secondNum;
      setState(() {});
    }

  }

  void _onTapMinusButton() {
    if (_formkey.currentState!.validate()){


    double firstNum = double.tryParse(_firstNumTEController.text) ?? 0;
    double secondNum = double.tryParse(_secondNumTEController.text) ?? 0;
    _result = firstNum - secondNum;
    setState(() {});
    }
  }

  void _onTapMultiplyButton() {
    if (_formkey.currentState!.validate()){

    double firstNum = double.tryParse(_firstNumTEController.text) ?? 0;
    double secondNum = double.tryParse(_secondNumTEController.text) ?? 0;
    _result = firstNum * secondNum;
    setState(() {});
    }
  }

  void _onTapDivisionButton() {
    if (_formkey.currentState!.validate()){

    double firstNum = double.tryParse(_firstNumTEController.text) ?? 0;
    double secondNum = double.tryParse(_secondNumTEController.text) ?? 0;
    _result = firstNum / secondNum;
    setState(() {});
    }
  }

  bool _validateTextFields(){
    if(_firstNumTEController.text.isEmpty){
      return false;
    }
    if(_secondNumTEController.text.isEmpty){
      return false;
    }
    return true;
  }
  @override
  void dispose(){
    _firstNumTEController.dispose();
    _secondNumTEController.dispose();
    super.dispose();
  }

}

