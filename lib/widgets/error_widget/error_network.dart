import 'package:flutter/material.dart';

class ErrorNetworkWidget extends StatelessWidget {
  final Function callback;
  const ErrorNetworkWidget({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Lỗi mạng, vui lòng kiểm tra lại!", textAlign: TextAlign.center,),
          ElevatedButton(onPressed: (){
            callback.call();
          }, child: const Text("Tải lại"))
        ],
      ),
    );
  }
}
