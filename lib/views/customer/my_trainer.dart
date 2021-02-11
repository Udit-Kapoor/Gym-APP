import 'package:flutter/material.dart';

class MyTrainer extends StatelessWidget {
  const MyTrainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _reviews = [
      {
        'profile_picture': 'image/profile.png',
        'name': 'Raja Kumar',
        'rating': 4,
        'time': 'a week ago',
        'description':
            'He is very good trainer. He is very good trainer. He is very good trainer. He is very good trainer. He is very good trainer. '
      },
      {
        'profile_picture': 'image/profile.png',
        'name': 'Raja Kumar',
        'rating': 4,
        'time': 'a week ago',
        'description': 'He is very good trainer'
      },
      {
        'profile_picture': 'image/profile.png',
        'name': 'Raja Kumar',
        'rating': 4,
        'time': 'a week ago',
        'description': 'He is very good trainer'
      },
      {
        'profile_picture': 'image/profile.png',
        'name': 'Raja Kumar',
        'rating': 4,
        'time': 'a week ago',
        'description': 'He is very good trainer'
      },
    ];

    final int _ratings = 3;
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
        title: Image.asset(
          'image/logo.png',
          fit: BoxFit.fill,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: CircleAvatar(
                  radius: 40.0,
                  child: Image.asset('image/profile.png'),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    'Pawan Pandit',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    '25, Male\nModel town, Delhi',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: IconButton(
                      icon: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 30.0, right: 20.0, top: 15.0, bottom: 5.0),
            child: Text('Avg. Rating'),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 5.0, bottom: 15.0),
            child: Row(
              children: [
                for (var i = 1; i <= _ratings; i++)
                  Icon(Icons.star, color: Colors.yellow),
                for (var i = 1; i <= 5 - _ratings; i++)
                  Icon(Icons.star_border, color: Colors.grey),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              // height: 60.0,
              margin: EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Write a Review',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 5.0, bottom: 15.0),
            child: Text(
              'Customer Reviews',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _reviews.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(10.0),
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            child: Image.asset(
                              _reviews[index]['profile_picture'],
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              _reviews[index]['name'],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          for (var i = 1; i <= _reviews[index]['rating']; i++)
                            Icon(Icons.star, color: Colors.yellow),
                          Spacer(),
                          Text(
                            _reviews[index]['time'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          _reviews[index]['description'],
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
