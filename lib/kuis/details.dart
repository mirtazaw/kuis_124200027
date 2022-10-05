import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'groceries.dart';
import 'dart:html' as html;

class Details extends StatefulWidget {
  final Groceries grocery;
  const Details({Key? key, required this.grocery}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  bool toggle = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.grocery.name}"),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                toggle = !toggle;
              });
            },
            icon: (toggle)
            ? Icon(Icons.favorite)
            : Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: (){
              html.window.open(widget.grocery.productUrl, "");
            },
            icon: Icon(Icons.open_in_new),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height) / 3,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.grocery.productImageUrls.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 6.0,
                      )
                    ]
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      widget.grocery.productImageUrls[index],
                      width: 200,
                      height: 210,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
            alignment: Alignment.center,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.lightBlue.shade700,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 50,),
                  Text(widget.grocery.name,
                    style:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  Text(
                    widget.grocery.storeName,
                    style:
                    TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Text(widget.grocery.description,),
                  ),
                  Text("Stock: ${widget.grocery.stock}",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Text("Discount: ${widget.grocery.discount}",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Text("Price: ${widget.grocery.price}",
                    style:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  Text("Review Average: ${widget.grocery.reviewAverage}",
                    style:
                    TextStyle(color: Colors.lightBlue, fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 50,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
