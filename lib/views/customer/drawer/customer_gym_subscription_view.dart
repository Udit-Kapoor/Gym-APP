import 'package:flutter/material.dart';
import 'package:gym_app/models/customer%20model/customer_subscription_model.dart';
import 'package:gym_app/views/customer/text_field_widget.dart';

class CustomerGymSubscriptionView extends StatelessWidget {
  const CustomerGymSubscriptionView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Gym Subscription',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: CustomerGymSubscription(),
    );
  }
}

class CustomerGymSubscription extends StatelessWidget {
  const CustomerGymSubscription({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: customerGymSub(),
      builder: (c, s) {
        var widget;
        if (s.connectionState == ConnectionState.waiting) {
          widget = Container(child: Center(child: CircularProgressIndicator()));
        } else if (s.hasData &&
            s.data.error &&
            s.connectionState == ConnectionState.done) {
          var cg = customerSubscriptionModelFromJson(s.data.data);

          List _facList = [];
          for (var fac in cg.specialFacility) _facList.add(fac.name);
          String _facilites = _facList.join(', ');

          List _actList = [];
          for (var act in cg.specialActivity) _actList.add(act.name);
          String _activities = _actList.join(', ');

          widget = ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: 20.0),
              TextFieldWidget(
                borderText: 'Batch Timings',
                bodyText: '${cg.batchTimeFrom} - ${cg.batchTimeTo}',
              ),
              TextFieldWidget(
                borderText: 'My Gym Subscription',
                bodyText: '${cg.plan.months} Months   \t${cg.plan.amount} Rs',
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 10.0),
                      borderText: 'Start Date',
                      bodyText: cg.startDate.toString(),
                    ),
                  ),
                  Expanded(
                    child: TextFieldWidget(
                      padding: EdgeInsets.fromLTRB(5.0, 10.0, 20.0, 10.0),
                      borderText: 'End Date',
                      bodyText: cg.endDate.toString(),
                    ),
                  )
                ],
              ),
              TextFieldWidget(
                borderText: 'Motive for Joining Gym',
                bodyText: cg.motive.isNotEmpty ? cg.motive : 'none',
              ),
              TextFieldWidget(
                borderText: 'Health Issues',
                bodyText: cg.healthIssues.isNotEmpty ? cg.healthIssues : 'none',
              ),
              //TODO: Api Doesn't have trainer name
              // TextFieldWidget(
              //   borderText: 'Trainer Name',
              //   bodyText: cg.,
              // ),
              TextFieldWidget(
                borderText: 'Diet',
                bodyText: cg.dietPlan,
              ),
              TextFieldWidget(
                borderText: 'Exercise Plan',
                bodyText:
                    cg.exercisePlan.active ? cg.exercisePlan.name : 'none',
              ),
              TextFieldWidget(
                borderText: 'Facilities Opted',
                bodyText: cg.specialFacility.length > 0 ? _facilites : 'none',
              ),
              TextFieldWidget(
                borderText: 'Extra Activities Opted',
                bodyText: cg.specialActivity.length > 0 ? _activities : 'none',
              ),
            ],
          );
        } else
          widget = Container(child: Center(child: Text("OOPS! NO DATA!")));
        return widget;
      },
    );
  }
}
