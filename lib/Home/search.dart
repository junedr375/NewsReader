import 'package:flutter/material.dart';
import 'package:triveous/Home/details.dart';

import 'package:triveous/Utils/utility.dart';


import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async' show Future;
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' show Client;



class Search extends StatefulWidget {


	@override
	_SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
	
  Map list;
  
  bool isSearched = false;
  bool isSearching = true;
  bool isInternetConnected = true;
  bool valueEmpty = false;
  bool noResult = false;

  final controller = TextEditingController();

  Timer searchOnStoppedTyping;
  Timer timer;



 Future checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      setState((){
        isInternetConnected = true;
        
      });
    } else{
      setState((){
        isInternetConnected = false;
        
      });
    }
  }


  _onChangeHandler(value ) {
        setState((){
        isSearching = false;
        noResult = false;
        });
        const duration = Duration(milliseconds:1000); // set the duration that you want call search() after that.
        if (searchOnStoppedTyping != null) {
            setState(() => searchOnStoppedTyping.cancel()); // clear timer
        }
        setState(() => searchOnStoppedTyping = new Timer(duration, () => search(value)));
    }

    search(value) {
        print('hello world from search . the value is $value');  
        if(value.length != 0) {
     	  	showData(value);
     		} else {
     			setState((){
     				valueEmpty = true;
     			});
     		}
    
    }

  Future showData(value) async {
    value = value.trim();
      print(value);
    //  try{

      
      	final String apiURL = 'https://newsapi.org/v2/everything?q=${value}&apiKey=${apiKey}';

	      http.Response resp = await http.get(apiURL);
	      list = json.decode(resp.body);
        if(list != null){
          if(list['articles'].length == 0) {
            setState((){
              noResult = true;
            });
          }
        }
	  


	      print(list);
	      setState((){
	        isSearched = true;
	        isSearching = true;
	      });
   }

    @override
    void initState(){
      checkConnection();
      timer = Timer.periodic(Duration(seconds: 10), (Timer t) => checkConnection());

    }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
      	appBar:new AppBar(
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
	        		child:Text('Search', style:TextStyle(color: Colors.black)),
	        		),
		        	Container(
		        		padding: EdgeInsets.only(right:10)
		        	)
	        	]
	        ),
         
        ),

        body:  (!isInternetConnected) ?   Container(
        
        child: Center(
        //  children: <Widget>[
          
           child:Card(
              color: Colors.white,
              margin:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.signal_cellular_connected_no_internet_4_bar,
                  color: Colors.black,
                ),
                title: Text(
                  'Check Internet Connection\n                    Retry',
                  style: TextStyle(fontSize: 17.0, fontFamily: 'Neucha',color: Colors.blue),
                ),
               onTap: () {
                  
                checkConnection();
                  },
              ),//ListTile
            ),  
          //]
        ),
      ) : 
         ListView(
          children: <Widget>[
            Container(
             
              padding: const EdgeInsets.all(8.0),
              child: TextField(
              	style: TextStyle(color:Colors.black , fontWeight: FontWeight.w300),

                onChanged: _onChangeHandler,
                controller: controller,
                decoration: new InputDecoration(
                  labelText: "Search",
                  labelStyle: TextStyle(color: Colors.black), 
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  suffixIcon: (!isSearching) ?  
                    Icon(Icons.language)

                   : IconButton(
                    icon: Icon(
                      Icons.close,color: Colors.black),
                    onPressed: () {
                      controller.clear();
                    },
                  ) ,
          
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 5.0),
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 5.0),
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.80,
              child: (isSearched == false ) ? 

              Container(
              	child:Center(
                  child: Text('"Try to Search Something"', style: TextStyle(color: Colors.blue,fontSize:30)) 
          		  )
              ) : (noResult) ? Container(
                child:Center(
                  child: Text('"No Result Found"', style: TextStyle(color: Colors.blue,fontSize:30)) 
                )
              ) : 

          ListView.builder(
				 			shrinkWrap: true,
				 			physics: ScrollPhysics(),//tO ADD SCROLL FUNCTIONALITY
	            scrollDirection: Axis.vertical,
	            itemCount: list['articles'] == null ? 0 : list['articles'].length,
	            itemBuilder: (BuildContext context, int index) {
	              return Container(
	              	height: 420,
	              	child:GestureDetector(
	              		onTap: () {
	              			Navigator.push(context,MaterialPageRoute(builder: (context) => Details(list['articles'][index]['url'])),);
	              		//	getMethodhome();
	              		},
	              		child: Stack(
                        children: <Widget>[
                          Container(
                            height: 420,
                            margin: EdgeInsets.symmetric(
                              horizontal: 4.0,
                              vertical: 5.0,
                            ),
                            width: MediaQuery.of(context).size.width*0.99,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.indigo[50],
                                  offset: Offset(0.0, 4.0),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Container(
                            	child:Column(
                            		children: <Widget>[
	                            		Container(
	                            			padding: EdgeInsets.only(top:20),
	                            			child:ClipRRect(
				                              borderRadius: BorderRadius.circular(0.0),
				                              child: Center(
				                              	child:Image(
					                                height:150,
					                                width: MediaQuery.of(context).size.width*0.90,
					                                image: NetworkImage(list['articles'][index]['urlToImage']),
					                                fit: BoxFit.fitWidth,
				                              	),
				                              ),
				                            ),
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:5,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list['articles'][index]['title'], style: TextStyle(fontSize:20,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:2,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list['articles'][index]['description'], style: TextStyle(fontSize:11,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:10,left:15,right:140),
				                          	child: Center(
				                          		child: Text('Date of Publication: ' + list['articles'][index]['publishedAt'], style: TextStyle(fontSize:10,color: Colors.blueGrey[400]))
				                          	)
				                          ),
				                        ]
				                      )
	                          )
                          ),//Container
                     
                        ],//Widget
                      ),//Stack
	         			 		)
              		);
            		}
            	)

            ),
          ],
        ),
    // 	),
    );
  }
  
}
