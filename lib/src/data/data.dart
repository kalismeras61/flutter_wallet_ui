import 'package:flutter/material.dart';
import 'package:flutter_wallet_ui_challenge/src/models/credit_card_model.dart';
import 'package:flutter_wallet_ui_challenge/src/models/payment_model.dart';
import 'package:flutter_wallet_ui_challenge/src/models/user_model.dart';

List<CreditCardModel> getCreditCards() {
  List<CreditCardModel> creditCards = [];
  creditCards.add(CreditCardModel(
      "4616900007729988",
      "https://resources.mynewsdesk.com/image/upload/ojf8ed4taaxccncp6pcp.png",
      "06/23",
      "192"));
  creditCards.add(CreditCardModel(
      "3015788947523652",
      "https://resources.mynewsdesk.com/image/upload/ojf8ed4taaxccncp6pcp.png",
      "04/25",
      "217"));
  return creditCards;
}

List<UserModel> getUsersCard() {
  List<UserModel> userCards = [
    UserModel("Anna", "assets/images/users/anna.jpeg"),
    UserModel("Gillian", "assets/images/users/gillian.jpeg"),
    UserModel("Judith", "assets/images/users/judith.jpeg"),
  ];

  return userCards;
}

List<PaymentModel> getPaymentsCard() {
  List<PaymentModel> paymentCards = [
    PaymentModel(Icons.receipt, Color(0xFFffd60f), "Florenti Restaurant",
        "07-23", "20.04", 251.00, -1),
    PaymentModel(Icons.monetization_on, Color(0xFFff415f), "Transfer To Anna",
        "07-23", "14.01", 64.00, -1),
    PaymentModel(Icons.location_city, Color(0xFF50f3e2), "Loan To Sanchez",
        "07-23", "10.04", 1151.00, -1),
    PaymentModel(Icons.train, Colors.green, "Train ticket to Turkey", "07-23",
        "09.04", 37.00, -1),
  ];

  return paymentCards;
}
