
class SubscriptionModel {
  final String subscriptionType;
  final String amount;
  final String planDetails1;
  final String planDetails2;


  SubscriptionModel({
    required this.subscriptionType,
    required this.amount,
    required this.planDetails1,
    required this.planDetails2,
  });
}

final List<SubscriptionModel> subscriptionModel = [
  SubscriptionModel(
    subscriptionType: 'Assist Athletes',
    amount: '\$09/30days',
    planDetails1: 'Plan is applicable only for the students of\n Mikhaela',
    planDetails2: '5 days free trail will be available',

  ),
  SubscriptionModel(
    subscriptionType: 'Individual Athletes',
    amount: '\$49/30days',
    planDetails1: 'Plan is applicable only for the students of\n Mikhaela',
    planDetails2: '5 days free trail will be available',

  ),
  SubscriptionModel(
    subscriptionType: 'Programs',
    amount: '\$499/30days',
    planDetails1: 'Plan is applicable only for the students of\n Mikhaela',
    planDetails2: '5 days free trail will be available',

  ),


];


