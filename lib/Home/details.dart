import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:triveous/Home/search.dart';

class Details extends StatefulWidget {
	final String url;
	Details(this.url);
	@override
	_DetailsState createState() => _DetailsState(url);
}

class _DetailsState extends State<Details> {
	final String url;
		final _key = UniqueKey();
	_DetailsState(this.url);

	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
      appBar: new AppBar(
         centerTitle: true,
         automaticallyImplyLeading: false,
          backgroundColor: Colors.white,

          title:Row(
	        	mainAxisAlignment: MainAxisAlignment.spaceBetween,
	        	children: <Widget> [

	        		Container(
		        	
		        		child: IconButton(
			            icon: Icon(
			              Icons.arrow_back,
			            ),
			            iconSize: 30,
			            color: Colors.black,
			            splashColor: Colors.blue,
			            onPressed: () {
			            	 Navigator.of(context).pop();
			            	},
			          ),
	        		),
	        	
	        		Container(
	        		child:Text('News Details', style:TextStyle(color: Colors.black)),
	        		),
		        	Container(
		        		child:GestureDetector(
		        			onTap: () {
		        				print('search');
		        				Navigator.push(context,MaterialPageRoute(builder: (context) => Search()),);
		        			},
		        			child:Icon(Icons.search, color: Colors.black),
		        		)
	        		),
	        	]
	        ),
         
        ),
      body: Column(
        children: [
          Expanded(
	          child: WebView(
              key: _key,
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: url)
	          )
          ],
        )
    );
	}
}