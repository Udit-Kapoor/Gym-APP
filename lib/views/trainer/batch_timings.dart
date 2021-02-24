import 'package:flutter/material.dart';
import 'package:gym_app/models/trainer/batch_timings_model.dart';
import 'package:gym_app/views/trainer/cleints_list.dart';

class BatchTimings extends StatefulWidget {
  BatchTimings({Key key}) : super(key: key);

  @override
  _BatchTimingsState createState() => _BatchTimingsState();
}

class _BatchTimingsState extends State<BatchTimings> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: clientListBatchwise(),
          builder: (c, s) {
            var widget;

            if (s.connectionState == ConnectionState.waiting) {
              widget =
                  Container(child: Center(child: CircularProgressIndicator()));
            } else if (s.hasData &&
                !s.data.error &&
                s.connectionState == ConnectionState.done) {
              var mb = batchTimingsModelFromJson(s.data.data);

              widget = Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'My Batches',
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          alignment: Alignment.centerRight,
                          icon: Icon(Icons.search),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {},
                      ),
                      Text(
                        'Today',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {},
                      ),
                    ],
                  ),
               

                  Expanded(
                    child: ListView.builder(
                      itemCount: mb.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => ClientsList(id: mb[index].id),
                              ),
                            );
                          },
                          leading: Text(
                            "${mb[index].batchTimeFrom} - ${mb[index].batchTimeTo}",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                mb[index].cust.length.toString(),
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Icon(Icons.person),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            } else
              widget = Container(child: Center(child: Text("OOPS! NO DATA!")));
            return widget;
          }),
    );
  }
}
