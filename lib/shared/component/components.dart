import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/module/WebViewScreen/WebViewScreen.dart';


Widget articelBuilderItem(list , context , {isSearch = false})
{
  return ConditionalBuilder(
    condition: list.length > 0,
    builder: (context){
      return  ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context , index){
          return articleListItem(list[index] , context);
        },
        separatorBuilder: (context , index)
        {
          return listDivider();
        },
        itemCount: list.length,
      );
    },
    fallback: (context){
      return isSearch ? Container() : Center(
        child: CircularProgressIndicator(),
      );
    },

  );
}

Widget articleListItem (article , context)
{
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return WebViewScreen(article['url']);
      }));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}',),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.headline1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget listDivider()
{
  return Padding(
    padding: const EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
    child: Container(
      width: double.infinity,
      height: 1.5,
      color: Colors.grey,
    ),
  );
}

Widget defaultFormField ({
  required final String text ,
  required final IconData prefixIcon,
  required final TextInputType inputType,
  required final  controller ,
  final String? Function(String?)? onChange ,
})
{
  return TextFormField(
      decoration: InputDecoration(
      labelText: text,
      labelStyle: TextStyle(
        fontSize: 18.0,
        color: Colors.blue,
      ),
      border: OutlineInputBorder(),
      prefixIcon: Icon(prefixIcon),
    ),
    keyboardType: inputType,
    controller: controller,
    onChanged: onChange,
  );
}