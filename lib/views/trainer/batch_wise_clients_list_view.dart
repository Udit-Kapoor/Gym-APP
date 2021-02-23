import 'package:flutter/material.dart';
import 'package:gym_app/models/trainer/client_list_batchwise_model.dart';
import 'package:gym_app/views/trainer/cleints_list.dart';

class BatchWiseClientsListView extends StatefulWidget {
  BatchWiseClientsListView({Key key}) : super(key: key);

  @override
  _BatchWiseClientsListViewState createState() =>
      _BatchWiseClientsListViewState();
}

class _BatchWiseClientsListViewState extends State<BatchWiseClientsListView> {
 
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
              var mb = clientListBatchwiseModelFromJson(s.data.data);

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
                  // for (var batch in batchList)
                  //   TimeTile(
                  //     timeText: batch['timings'],
                  //     batchSize: batch['batchSize'],
                  //     remote: (Random().nextInt(10) + 1) % 2 == 0
                  //         ? false
                  //         : true,
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) =>
                  //               ClientsList(batchTimings: batch['timings']),
                  //         ),
                  //       );
                  //     },
                  //   ),

                  Expanded(
                    child: ListView.builder(
                      itemCount: mb.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/ClientsList',
                              arguments: mb[index].id,
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

// class TimeTile extends StatelessWidget {
//   const TimeTile({
//     Key key,
//     @required this.timeText,
//     @required this.batchSize,
//     @required this.remote,
//     this.onTap,
//   }) : super(key: key);
//   final String timeText;
//   final int batchSize;
//   final bool remote;
//   final Function onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Spacer(),
//           Text(
//             timeText,
//             textAlign: TextAlign.center,
//             style: Theme.of(context)
//                 .textTheme
//                 .headline5
//                 .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
//           ),
//           Spacer(flex: 3),
//           Text(batchSize.toString()),
//           Spacer(),
//           Icon(Icons.person),
//           Spacer(),
//           Icon(
//             Icons.location_on,
//             color: remote ? Colors.red : Colors.transparent,
//           ),
//           Spacer(),
//         ],
//       ),
//     );
//   }
// }
