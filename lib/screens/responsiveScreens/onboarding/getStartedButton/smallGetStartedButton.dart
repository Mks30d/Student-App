import 'package:flutter/material.dart';
import 'package:studentapp/services/secureStorage.dart';
import 'package:studentapp/wrapper.dart';
class SmStartedButton extends StatelessWidget {
  const SmStartedButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.8,
      left: size.width * 0.29,
      child: ElevatedButton(
        onPressed: ()async{
          showDialog(
              context: context,
              builder: (context){
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue[900],
                  ),
                );
              });
          await UserSecureStorage.setOnboarding("true");
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) =>Wrapper()),
                (Route<dynamic> route) => false,
          );
        },
        child: Text(
          "Let's Get Started",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[900],
          shape: RoundedRectangleBorder(),
          padding: EdgeInsets.all(12),
        ),
      ),
    );
  }
}