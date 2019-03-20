import 'package:flutter/material.dart';
import 'package:flutter_wallet_ui_challenge/src/models/user_model.dart';

class UserCardWidget extends StatelessWidget {
  final UserModel user;
  const UserCardWidget({Key key, this.user})
      : assert(user != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100.0,
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.lightBlue.shade50,
            blurRadius: 8.0,
            spreadRadius: 4,
          ),
          BoxShadow(
            color: Colors.white,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(user.profilePic),
            radius: 25,
            backgroundColor: Color(0xfff1f3f5),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              user.name,
              style: TextStyle(
                  inherit: true,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: Colors.grey),
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
