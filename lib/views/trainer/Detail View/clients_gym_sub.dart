import 'package:flutter/material.dart';
import 'package:gym_app/models/trainer/clients_gym_sub_model.dart';
import 'package:gym_app/views/customer/text_field_widget.dart';

class ClientsGymSubscription extends StatelessWidget {
  final int id;

  const ClientsGymSubscription({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: clientsGymSub(id),
      builder: (c, s) {
        var widget;
        if (s.connectionState == ConnectionState.waiting) {
          widget = Container(child: Center(child: CircularProgressIndicator()));
        } else if (s.hasData &&
            !s.data.error &&
            s.connectionState == ConnectionState.done) {
          var cg = clientsGymSubModelFromJson(s.data.data);

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
              TextFieldWidget(
                borderText: 'Trainer Name',
                bodyText: cg.trainername,
              ),
              TextFieldWidget(
                borderText: 'Diet',
                bodyText: cg.dietPlan,
              ),
              TextFieldWidget(
                borderText: 'Exercise Plan',
                bodyText: cg.exercisePlan.name,
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
