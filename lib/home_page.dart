import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<Map> myList = [
    {
      'title': 'Messi',
      'des': 'He is a messi...',
      'imgUrl': 'images/messi1.png'
    },
    {
      'title': 'Ronaldo',
      'des': 'He is a ronaldo...',
      'imgUrl': 'images/ronaldo.png'
    },
    {
      'title': 'Messi',
      'des': 'He is a messi...',
      'imgUrl': 'images/messi1.png'
    },
    {
      'title': 'Ronaldo',
      'des': 'He is a ronaldo...',
      'imgUrl': 'images/ronaldo.png'
    },
    {
      'title': 'Messi',
      'des': 'He is a messi...',
      'imgUrl': 'images/messi1.png'
    },
    {
      'title': 'Ronaldo',
      'des': 'He is a ronaldo...',
      'imgUrl': 'images/ronaldo.png'
    },
  ];

  mySnackBarMessage(String message, BuildContext context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Photo Gallery'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              'Welcome to my photo gallery!',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Search for photos..',
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .30,
              width: double.infinity,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7),
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 120,
                        width: 150,
                        child: Image.asset(
                          myList[index]['imgUrl'],
                          fit: BoxFit.cover,
                        )),
                    Text(myList[index]['title']),
                  ],
                ),
                itemCount: myList.length,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                    myList[index]['imgUrl'],
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        title: Text(myList[index]['title']),
                        subtitle: Text(myList[index]['des']),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: myList.length - 3),
            ),
            FloatingActionButton(
              onPressed: () {
                mySnackBarMessage('photo updated successfully', context);
              },
              child: Icon(Icons.upload),
            )
          ],
        ),
      ),
    );
  }
}
