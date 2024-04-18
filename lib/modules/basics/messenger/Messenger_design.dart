import 'package:flutter/material.dart';

class Messengerscreen extends StatelessWidget {
  const Messengerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg"),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "Chats",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {},
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                size: 16.0,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(onPressed: () {},
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                size: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                        "Search"
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 75.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,//افقي
                  itemBuilder: (context, index) => buildstoryitem(),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20.0,
                  ),
                  itemCount: 20,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index) =>buildchatitem(),
                separatorBuilder: (context,index) => SizedBox(height: 20.0,),
                itemCount: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }


  //1 BUILD ITEM
  //2 BUILD LIST
  //3 ADD ITEM TO LIST
  //arrow function
  Widget buildchatitem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg"),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.5,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mido Mido Mido Mido Mido Mido Mido ',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'hello my name is ramy hello my name is ramy hello my name is ramy hello my name is ramy hello my name is ramy hello my name is ramy hello my name is ramy hello my name is ramy hello my name is ramy hello my name is ramy',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0),
                      child: Container(
                        height: 8.0,
                        width: 8.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text(
                      '06:05 pm',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  Widget buildstoryitem() => Container(
        width: 50.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(
                      "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg"),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 3.0,
                    end: 3.0,
                  ),
                  child: CircleAvatar(
                    radius: 6.5,
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              'Mido',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );

}
