import 'package:flutter/material.dart';
import 'package:flutter_wallet_ui_challenge/src/models/payment_model.dart';

class PaymentCardWidget extends StatefulWidget {
  final PaymentModel payment;

  const PaymentCardWidget({Key key, this.payment}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PaymentCardWidgetState();
}

class _PaymentCardWidgetState extends State<PaymentCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        dense: true,
        trailing: Text(
          "${widget.payment.type > 0 ? "+" : "-"} \$ ${widget.payment.amount}",
          style: TextStyle(
              inherit: true, fontWeight: FontWeight.w700, fontSize: 16.0),
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Material(
            elevation: 10,
            shape: CircleBorder(),
            shadowColor: widget.payment.color.withOpacity(0.4),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: widget.payment.color,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Icon(
                  widget.payment.icon,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              widget.payment.name,
              style: TextStyle(
                  inherit: true, fontWeight: FontWeight.w700, fontSize: 16.0),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(widget.payment.date,
                  style: TextStyle(
                      inherit: true, fontSize: 12.0, color: Colors.black45)),
              SizedBox(
                width: 20,
              ),
              Text(widget.payment.hour,
                  style: TextStyle(
                      inherit: true, fontSize: 12.0, color: Colors.black45)),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
