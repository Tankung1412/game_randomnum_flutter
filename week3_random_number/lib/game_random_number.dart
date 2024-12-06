import 'dart:math';
import 'package:flutter/material.dart';

class RandomGame extends StatefulWidget {
  const RandomGame({super.key});

  @override
  State<RandomGame> createState() => _RandomGameState();
}

class _RandomGameState extends State<RandomGame> {
  var rnd = Random();
  var r = 0 ;
  final TextEditingController _numIn = TextEditingController();
  String str = '';

  TextStyle textStyle() => const TextStyle(
        color: Colors.indigo,
        fontSize: 20,
        fontWeight: FontWeight.normal,
      );

  TextStyle textStyle1() => const TextStyle(
    color: Colors.green,
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  TextStyle textStyle2() => const TextStyle(
    color: Colors.red,
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  Widget TextFieldInputnum() => TextField(
    controller: _numIn,
    keyboardType: TextInputType.number,
    decoration: const InputDecoration(hintText: 'เดาตัวเลข'),
    style: textStyle(),
  );

  void randNum(){
    r = rnd.nextInt(9)+1;
    str = '';
    _numIn.clear();
  }

  void btnCheckAns(){
    final numIn = int.tryParse(_numIn.text);
    setState(() {
      if(numIn == r){
        str = 'สุดยอด!! คุณตอบถูก' ;
      }
      else
      {
        str = 'ผิด คำตอบที่ถูกคือ $r' ;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 239, 146, 255),
      title: const Text('G U E S S (1-9)', style: TextStyle(fontWeight: FontWeight.bold),),),
    body: Center(
      child: Column(children: [
        const SizedBox(height: 20,),
        SizedBox(
          child: Text(str,style: const TextStyle(fontSize: 30),),
        ),
        SizedBox(
          width: 350,
          child: TextFieldInputnum(),
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(child: Text('เดาตัวเลข 1-9'),),
        const SizedBox(height: 20,),
        SizedBox(
          width: 350,
          child: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [       
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () => btnCheckAns(), 
                child: const Text('ส่งคำตอบ', style: TextStyle(color: Colors.black)), ),
              const SizedBox(width: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () => randNum(), 
                child: const Text('เริ่มใหม่', style: TextStyle(color: Colors.black)))
            ],) )
          ),
      ],)
    ),
  );
  }
}