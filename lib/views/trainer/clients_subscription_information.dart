import 'package:flutter/material.dart';
import 'package:gym_app/views/customer/text_field_widget.dart';

class SubscriptionInfo extends StatelessWidget {
  const SubscriptionInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextFieldWidget(
          borderText: 'Batch Timings',
          bodyText: '09.30 a.m. - 10.30 a.m.',
        ),
        TextFieldWidget(
          borderText: 'My Gym Subscription',
          bodyText: '3 Months\t2000 Rs',
        ),
        Row(
          children: [
            Expanded(
              child: TextFieldWidget(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 10.0),
                borderText: 'Start Date',
                bodyText: '12-06-2020',
              ),
            ),
            Expanded(
              child: TextFieldWidget(
                padding: EdgeInsets.fromLTRB(5.0, 10.0, 20.0, 10.0),
                borderText: 'End Date',
                bodyText: '12-09-2020',
              ),
            )
          ],
        ),
        TextFieldWidget(
          borderText: 'Motive for Joining Gym',
          bodyText: 'Weight Loss',
        ),
        TextFieldWidget(
          borderText: 'Health Issues',
          bodyText: 'None',
        ),
        TextFieldWidget(
          borderText: 'Trainer Name',
          bodyText: 'Pawan Kumar',
        ),
        TextFieldWidget(
          borderText: 'Diet',
          bodyText: 'Fat Loss Veg Diet 2',
        ),
        TextFieldWidget(
          borderText: 'Exercise Plan',
          bodyText: 'Exercise Plan B',
        ),
        TextFieldWidget(
          borderText: 'Facilities Opted',
          bodyText: 'Shower, Steam',
        ),
        TextFieldWidget(
          borderText: 'Extra Activities Opted',
          bodyText: 'Zumba, Yoga',
        ),
      ],
    );
  }
}
