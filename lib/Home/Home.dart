import 'package:flutter/material.dart';
import 'package:triveous/Utils/utility.dart';

import 'package:triveous/Home/details.dart';
import 'package:triveous/Home/search.dart';
import 'package:triveous/Home/settings.dart';

import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async' show Future;
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' show Client;

class HomePage extends StatefulWidget {
	@override
	_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



	Map list,list2,list3,list4,list5,list6,list7,list8,list9,list10;
	
	bool isInternetConnected = true;
	Timer timer,timer2;


	bool ismainLoaded = false;
	bool ismainLoaded2 = false;
	bool ismainLoaded3 = false;
	bool ismainLoaded4 = false;
	bool ismainLoaded5 = false;
	bool ismainLoaded6 = false;
	bool ismainLoaded7 = false;
	bool ismainLoaded8 = false;
	bool ismainLoaded9 = false;
	bool ismainLoaded10 = false;

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


   Future getMethodhome() async {
////////////////////////////////////                      1              //////////////////////////////////////
     final String apiURL = 'https://newsapi.org/v2/everything?q=BuzzFeed&apiKey=${apiKey}';
      http.Response res = await http.get(apiURL);
      list = json.decode(res.body);

      if(list != null ){
      setState((){
        ismainLoaded = true;
      });
     } else {
     	setState((){
        ismainLoaded = false;
      });
     }
     //print(list);
     print(list['articles'][0]['author']);


////////////////////////////////                 2                      //////////////////////////////////////
     final String apiURL2 = 'https://newsapi.org/v2/everything?q=CNN&apiKey=${apiKey}';
      http.Response res2 = await http.get(apiURL2);
      list2 = json.decode(res2.body);

     if(list2 != null ){
      setState((){
        ismainLoaded2 = true;
      });
     } else {
     	setState((){
        ismainLoaded2 = false;
      });
     }
//////////////////////////////////////             3           //////////////////////////////////////////////
	final String apiURL3 = 'https://newsapi.org/v2/everything?q=ESPN&apiKey=${apiKey}';
      http.Response res3 = await http.get(apiURL3);
      list3 = json.decode(res3.body);

      if(list3 != null ){
      setState((){
        ismainLoaded3 = true;
      });
     } else {
     	setState((){
        ismainLoaded3 = false;
      });
     }
     //print(list3);

 //////////////////////////////////////             4           //////////////////////////////////////////////
	final String apiURL4 = 'https://newsapi.org/v2/everything?q=Sports&apiKey=${apiKey}';
      http.Response res4 = await http.get(apiURL4);
      list4 = json.decode(res4.body);

      if(list4 != null ){
      setState((){
        ismainLoaded4 = true;
      });
     } else {
     	setState((){
        ismainLoaded4 = false;
      });
     }
     //print(list3);

     //////////////////////////////////////             5           //////////////////////////////////////////////
	final String apiURL5 = 'https://newsapi.org/v2/everything?q=Politics&apiKey=${apiKey}';
      http.Response res5 = await http.get(apiURL5);
      list5 = json.decode(res5.body);

      if(list5 != null ){
      setState((){
        ismainLoaded5 = true;
      });
     } else {
     	setState((){
        ismainLoaded5 = false;
      });
     }
       //////////////////////////////////////             6           //////////////////////////////////////////////
	final String apiURL6 = 'https://newsapi.org/v2/everything?q=Celebrity&apiKey=${apiKey}';
      http.Response res6 = await http.get(apiURL6);
      list6 = json.decode(res6.body);

      if(list6 != null ){
      setState((){
        ismainLoaded6 = true;
      });
     } else {
     	setState((){
        ismainLoaded6 = false;
      });
     }
           //////////////////////////////////////             7           //////////////////////////////////////////////
	final String apiURL7 = 'https://newsapi.org/v2/everything?q=Trends&apiKey=${apiKey}';
      http.Response res7 = await http.get(apiURL7);
      list7 = json.decode(res7.body);

      if(list7 != null ){
      setState((){
        ismainLoaded7 = true;
      });
     } else {
     	setState((){
        ismainLoaded7 = false;
      });
     }

             //////////////////////////////////////             8           //////////////////////////////////////////////
	final String apiURL8 = 'https://newsapi.org/v2/everything?q=Cartoons&apiKey=${apiKey}';
      http.Response res8 = await http.get(apiURL8);
      list8 = json.decode(res8.body);

      if(list8 != null ){
      setState((){
        ismainLoaded8 = true;
      });
     } else {
     	setState((){
        ismainLoaded8 = false;
      });
     }

                 //////////////////////////////////////             9           //////////////////////////////////////////////
	final String apiURL9 = 'https://newsapi.org/v2/everything?q=Religion&apiKey=${apiKey}';
      http.Response res9 = await http.get(apiURL9);
      list9 = json.decode(res9.body);

      if(list9 != null ){
      setState((){
        ismainLoaded9 = true;
      });
     } else {
     	setState((){
        ismainLoaded9 = false;
      });
     }
                     //////////////////////////////////////             10           //////////////////////////////////////////////
	final String apiURL10 = 'https://newsapi.org/v2/everything?q=Astronomy&apiKey=${apiKey}';
      http.Response res10 = await http.get(apiURL10);
      list10 = json.decode(res10.body);

      if(list10 != null ){
      setState((){
        ismainLoaded10 = true;
      });
     } else {
     	setState((){
        ismainLoaded10 = false;
      });
     }
   
   
		    

  }


  @override
  void initState() {
  	checkConnection();
    timer = Timer.periodic(Duration(seconds: 10), (Timer t) => checkConnection());
    timer2 = Timer.periodic(Duration(seconds: 10), (Timer t) => getMethodhome());
    getMethodhome();
    super.initState();
    
  }



	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
	        centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
	        title: Row(
	        	mainAxisAlignment: MainAxisAlignment.spaceBetween,
	        	children: <Widget> [
	        		Container(
		        	
		        		child: ClipOval(
								  child: Material(
								    color: Colors.blue[100],
								    child: InkWell(
								     // splashColor: Colors.red, // inkwell color
								      child: SizedBox(width: 40, height: 40, child: Icon(Icons.person, color: Colors.blue)),
								      onTap: () {
								      		Navigator.push(context,MaterialPageRoute(builder: (context) => Settings()),);
								      	},
								    ),
								  ),
								)
	        		),
	        		Container(
	        		child:Text('Home', style:TextStyle(color: Colors.black)),
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
	      
	      ),//AppBar 
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
      ) : ListView(
				children: <Widget>[
					/*Container(
						height: 30,
						child: GestureDetector(
							onTap: () {
								getMethodhome();

							},
							child:Center(
								child: Text('Tap to Refresh')
							)
						)
					),*/
					Container(
						child: _tabSection(context)
					),
					
				]
			)
		);
	}

	Widget _tabSection(BuildContext context) {
  return DefaultTabController(
    length: 10,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: TabBar(
          	isScrollable: true,
	        	indicatorColor: Colors.blue,
	          labelColor: Colors.black,
	          unselectedLabelColor: Colors.grey,  	
          	tabs: [
				      Tab(text: "BuzzFeed"),
	            Tab(text: "CNN"),
	            Tab(text: "ESPN"),
	            Tab(text: "Sports"),
	            Tab(text: "Politics"),
	            Tab(text: "Celebs"),
	            Tab(text: "Trending"),
	            Tab(text: "Cartoons"),
	            Tab(text: "Religious"),
	            Tab(text: "Astronomy"),
          ]),
        ),
        Container(
        	height: MediaQuery.of(context).size.height*0.78,
        	child: TabBarView(children: [


        		///////////////////////////                    1              ////////////////////
        		
        		Container(
		        	child: (!ismainLoaded) ? Container(
			          child:GestureDetector(
			            onTap: () {
			                getMethodhome();
			              },
			            child: Center(
			              child:CircularProgressIndicator(
			                backgroundColor: Colors.white,
			                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
			          
			              )
			            )
			          ) 
			        ) :ListView.builder(
				 			shrinkWrap: true,
				 			physics: ScrollPhysics(),//tO ADD SCROLL FUNCTIONALITY
	            scrollDirection: Axis.vertical,
	            itemCount: list == null ? 0 : list['articles'].length,
	            itemBuilder: (BuildContext context, int index) {
	              return Container(
	              	height: 420,
	              	child:GestureDetector(
	              		onTap: () {
	              			//getMethodhome();
	              				Navigator.push(context,MaterialPageRoute(builder: (context) => Details(list['articles'][index]['url'])),);
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
					                                height:180,
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
						///////////////////////////////////                   2            //////////////////////
        		Container(
		        	child: (!ismainLoaded2) ? Container(
			          child:GestureDetector(
			            onTap: () {
			                getMethodhome();
			              },
			            child: Center(
			              child:CircularProgressIndicator(
			                backgroundColor: Colors.white,
			                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
			          
			              )
			            )
			          ) 
			        ) :ListView.builder(
				 			shrinkWrap: true,
				 			physics: ScrollPhysics(),//tO ADD SCROLL FUNCTIONALITY
	            scrollDirection: Axis.vertical,
	            itemCount: list2 == null ? 0 : list2['articles'].length,
	            itemBuilder: (BuildContext context, int index) {
	              return Container(
	              	height: 420,
	              	child:GestureDetector(
	              		onTap: () {
	              			//getMethodhome();
	              			Navigator.push(context,MaterialPageRoute(builder: (context) => Details(list2['articles'][index]['url'])),);
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
					                                height:180,
					                                width: MediaQuery.of(context).size.width*0.90,
					                                image: NetworkImage(list2['articles'][index]['urlToImage']),
					                                fit: BoxFit.fitWidth,
				                              	),
				                              ),
				                            ),
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:5,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list2['articles'][index]['title'], style: TextStyle(fontSize:20,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:2,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list2['articles'][index]['description'], style: TextStyle(fontSize:11,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:10,left:15,right:140),
				                          	child: Center(
				                          		child: Text('Date of Publication: ' + list2['articles'][index]['publishedAt'], style: TextStyle(fontSize:10,color: Colors.blueGrey[400]))
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
				////////////////////////////////////              3             /////////////////////////////
						Container(
		        	child: (!ismainLoaded3) ? Container(
			          child:GestureDetector(
			            onTap: () {
			                getMethodhome();
			              },
			            child: Center(
			              child:CircularProgressIndicator(
			                backgroundColor: Colors.white,
			                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
			          
			              )
			            )
			          ) 
			        ) :ListView.builder(
				 			shrinkWrap: true,
				 			physics: ScrollPhysics(),//tO ADD SCROLL FUNCTIONALITY
	            scrollDirection: Axis.vertical,
	            itemCount: list3 == null ? 0 : list3['articles'].length,
	            itemBuilder: (BuildContext context, int index) {
	              return Container(
	              	height: 420,
	              	child:GestureDetector(
	              		onTap: () {
	              			//getMethodhome();
	              			Navigator.push(context,MaterialPageRoute(builder: (context) => Details(list3['articles'][index]['url'])),);
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
					                                height:180,
					                                width: MediaQuery.of(context).size.width*0.90,
					                                image: NetworkImage(list3['articles'][index]['urlToImage']),
					                                fit: BoxFit.fitWidth,
				                              	),
				                              ),
				                            ),
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:5,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list3['articles'][index]['title'], style: TextStyle(fontSize:20,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:2,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list3['articles'][index]['description'], style: TextStyle(fontSize:11,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:10,left:15,right:140),
				                          	child: Center(
				                          		child: Text('Date of Publication: ' + list3['articles'][index]['publishedAt'], style: TextStyle(fontSize:10,color: Colors.blueGrey[400]))
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

				////////////////////////////////////              4             /////////////////////////////
						Container(
		        	child: (!ismainLoaded4) ? Container(
			          child:GestureDetector(
			            onTap: () {
			                getMethodhome();
			              },
			            child: Center(
			              child:CircularProgressIndicator(
			                backgroundColor: Colors.white,
			                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
			          
			              )
			            )
			          ) 
			        ) :ListView.builder(
				 			shrinkWrap: true,
				 			physics: ScrollPhysics(),//tO ADD SCROLL FUNCTIONALITY
	            scrollDirection: Axis.vertical,
	            itemCount: list4 == null ? 0 : list4['articles'].length,
	            itemBuilder: (BuildContext context, int index) {
	              return Container(
	              	height: 420,
	              	child:GestureDetector(
	              		onTap: () {
	              			//getMethodhome();
	              			Navigator.push(context,MaterialPageRoute(builder: (context) => Details(list4['articles'][index]['url'])),);
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
					                                height:180,
					                                width: MediaQuery.of(context).size.width*0.90,
					                                image: NetworkImage(list4['articles'][index]['urlToImage']),
					                                fit: BoxFit.fitWidth,
				                              	),
				                              ),
				                            ),
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:5,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list4['articles'][index]['title'], style: TextStyle(fontSize:20,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:2,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list4['articles'][index]['description'], style: TextStyle(fontSize:11,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:10,left:15,right:140),
				                          	child: Center(
				                          		child: Text('Date of Publication: ' + list4['articles'][index]['publishedAt'], style: TextStyle(fontSize:10,color: Colors.blueGrey[400]))
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
	////////////////////////////////////              5             /////////////////////////////
						Container(
		        	child: (!ismainLoaded5) ? Container(
			          child:GestureDetector(
			            onTap: () {
			                getMethodhome();
			              },
			            child: Center(
			              child:CircularProgressIndicator(
			                backgroundColor: Colors.white,
			                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
			          
			              )
			            )
			          ) 
			        ) :ListView.builder(
				 			shrinkWrap: true,
				 			physics: ScrollPhysics(),//tO ADD SCROLL FUNCTIONALITY
	            scrollDirection: Axis.vertical,
	            itemCount: list5 == null ? 0 : list5['articles'].length,
	            itemBuilder: (BuildContext context, int index) {
	              return Container(
	              	height: 420,
	              	child:GestureDetector(
	              		onTap: () {
	              			//getMethodhome();
	              			Navigator.push(context,MaterialPageRoute(builder: (context) => Details(list5['articles'][index]['url'])),);
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
					                                height:180,
					                                width: MediaQuery.of(context).size.width*0.90,
					                                image: NetworkImage(list5['articles'][index]['urlToImage']),
					                                fit: BoxFit.fitWidth,
				                              	),
				                              ),
				                            ),
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:5,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list5['articles'][index]['title'], style: TextStyle(fontSize:20,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:2,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list5['articles'][index]['description'], style: TextStyle(fontSize:11,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:10,left:15,right:140),
				                          	child: Center(
				                          		child: Text('Date of Publication: ' + list5['articles'][index]['publishedAt'], style: TextStyle(fontSize:10,color: Colors.blueGrey[400]))
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

////////////////////////////////////              6             /////////////////////////////
						Container(
		        	child: (!ismainLoaded6) ? Container(
			          child:GestureDetector(
			            onTap: () {
			                getMethodhome();
			              },
			            child: Center(
			              child:CircularProgressIndicator(
			                backgroundColor: Colors.white,
			                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
			          
			              )
			            )
			          ) 
			        ) :ListView.builder(
				 			shrinkWrap: true,
				 			physics: ScrollPhysics(),//tO ADD SCROLL FUNCTIONALITY
	            scrollDirection: Axis.vertical,
	            itemCount: list6 == null ? 0 : list6['articles'].length,
	            itemBuilder: (BuildContext context, int index) {
	              return Container(
	              	height: 420,
	              	child:GestureDetector(
	              		onTap: () {
	              			//getMethodhome();
	              			Navigator.push(context,MaterialPageRoute(builder: (context) => Details(list6['articles'][index]['url'])),);
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
					                                height:180,
					                                width: MediaQuery.of(context).size.width*0.90,
					                                image: NetworkImage(list6['articles'][index]['urlToImage']),
					                                fit: BoxFit.fitWidth,
				                              	),
				                              ),
				                            ),
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:5,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list6['articles'][index]['title'], style: TextStyle(fontSize:20,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:2,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list6['articles'][index]['description'], style: TextStyle(fontSize:11,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:10,left:15,right:140),
				                          	child: Center(
				                          		child: Text('Date of Publication: ' + list6['articles'][index]['publishedAt'], style: TextStyle(fontSize:10,color: Colors.blueGrey[400]))
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
////////////////////////////////////              7             /////////////////////////////
						Container(
		        	child: (!ismainLoaded7) ? Container(
			          child:GestureDetector(
			            onTap: () {
			                getMethodhome();
			              },
			            child: Center(
			              child:CircularProgressIndicator(
			                backgroundColor: Colors.white,
			                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
			          
			              )
			            )
			          ) 
			        ) :ListView.builder(
				 			shrinkWrap: true,
				 			physics: ScrollPhysics(),//tO ADD SCROLL FUNCTIONALITY
	            scrollDirection: Axis.vertical,
	            itemCount: list7 == null ? 0 : list7['articles'].length,
	            itemBuilder: (BuildContext context, int index) {
	              return Container(
	              	height: 420,
	              	child:GestureDetector(
	              		onTap: () {
	              			//getMethodhome();
	              			Navigator.push(context,MaterialPageRoute(builder: (context) => Details(list7['articles'][index]['url'])),);
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
					                                height:180,
					                                width: MediaQuery.of(context).size.width*0.90,
					                                image: NetworkImage(list7['articles'][index]['urlToImage']),
					                                fit: BoxFit.fitWidth,
				                              	),
				                              ),
				                            ),
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:5,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list7['articles'][index]['title'], style: TextStyle(fontSize:20,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:2,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list7['articles'][index]['description'], style: TextStyle(fontSize:11,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:10,left:15,right:140),
				                          	child: Center(
				                          		child: Text('Date of Publication: ' + list7['articles'][index]['publishedAt'], style: TextStyle(fontSize:10,color: Colors.blueGrey[400]))
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

////////////////////////////////////              8             /////////////////////////////
						Container(
		        	child: (!ismainLoaded8) ? Container(
			          child:GestureDetector(
			            onTap: () {
			                getMethodhome();
			              },
			            child: Center(
			              child:CircularProgressIndicator(
			                backgroundColor: Colors.white,
			                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
			          
			              )
			            )
			          ) 
			        ) :ListView.builder(
				 			shrinkWrap: true,
				 			physics: ScrollPhysics(),//tO ADD SCROLL FUNCTIONALITY
	            scrollDirection: Axis.vertical,
	            itemCount: list8 == null ? 0 : list8['articles'].length,
	            itemBuilder: (BuildContext context, int index) {
	              return Container(
	              	height: 420,
	              	child:GestureDetector(
	              		onTap: () {
	              			//getMethodhome();
	              			Navigator.push(context,MaterialPageRoute(builder: (context) => Details(list8['articles'][index]['url'])),);
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
					                                height:180,
					                                width: MediaQuery.of(context).size.width*0.90,
					                                image: NetworkImage(list8['articles'][index]['urlToImage']),
					                                fit: BoxFit.fitWidth,
				                              	),
				                              ),
				                            ),
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:5,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list8['articles'][index]['title'], style: TextStyle(fontSize:20,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:2,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list8['articles'][index]['description'], style: TextStyle(fontSize:11,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:10,left:15,right:140),
				                          	child: Center(
				                          		child: Text('Date of Publication: ' + list8['articles'][index]['publishedAt'], style: TextStyle(fontSize:10,color: Colors.blueGrey[400]))
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

////////////////////////////////////              9             /////////////////////////////
						Container(
		        	child: (!ismainLoaded9) ? Container(
			          child:GestureDetector(
			            onTap: () {
			                getMethodhome();
			              },
			            child: Center(
			              child:CircularProgressIndicator(
			                backgroundColor: Colors.white,
			                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
			          
			              )
			            )
			          ) 
			        ) :ListView.builder(
				 			shrinkWrap: true,
				 			physics: ScrollPhysics(),//tO ADD SCROLL FUNCTIONALITY
	            scrollDirection: Axis.vertical,
	            itemCount: list9 == null ? 0 : list9['articles'].length,
	            itemBuilder: (BuildContext context, int index) {
	              return Container(
	              	height: 420,
	              	child:GestureDetector(
	              		onTap: () {
	              			//getMethodhome();
	              			Navigator.push(context,MaterialPageRoute(builder: (context) => Details(list9['articles'][index]['url'])),);
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
					                                height:180,
					                                width: MediaQuery.of(context).size.width*0.90,
					                                image: NetworkImage(list9['articles'][index]['urlToImage']),
					                                fit: BoxFit.fitWidth,
				                              	),
				                              ),
				                            ),
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:5,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list9['articles'][index]['title'], style: TextStyle(fontSize:20,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:2,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list9['articles'][index]['description'], style: TextStyle(fontSize:11,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:10,left:15,right:140),
				                          	child: Center(
				                          		child: Text('Date of Publication: ' + list9['articles'][index]['publishedAt'], style: TextStyle(fontSize:10,color: Colors.blueGrey[400]))
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


////////////////////////////////////              10            /////////////////////////////
						Container(
		        	child: (!ismainLoaded10) ? Container(
			          child:GestureDetector(
			            onTap: () {
			                getMethodhome();
			              },
			            child: Center(
			              child:CircularProgressIndicator(
			                backgroundColor: Colors.white,
			                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
			          
			              )
			            )
			          ) 
			        ) :ListView.builder(
				 			shrinkWrap: true,
				 			physics: ScrollPhysics(),//tO ADD SCROLL FUNCTIONALITY
	            scrollDirection: Axis.vertical,
	            itemCount: list10 == null ? 0 : list10['articles'].length,
	            itemBuilder: (BuildContext context, int index) {
	              return Container(
	              	height: 420,
	              	child:GestureDetector(
	              		onTap: () {
	              			//getMethodhome();
	              			Navigator.push(context,MaterialPageRoute(builder: (context) => Details(list10['articles'][index]['url'])),);
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
					                                height:180,
					                                width: MediaQuery.of(context).size.width*0.90,
					                                image: NetworkImage(list10['articles'][index]['urlToImage']),
					                                fit: BoxFit.fitWidth,
				                              	),
				                              ),
				                            ),
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:5,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list10['articles'][index]['title'], style: TextStyle(fontSize:20,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:2,left:15,right:10),
				                          	child: Center(
				                          		child: Text(list10['articles'][index]['description'], style: TextStyle(fontSize:11,))
				                          	)
				                          ),
				                          Container(
				                          	padding: EdgeInsets.only(top:10,left:15,right:140),
				                          	child: Center(
				                          		child: Text('Date of Publication: ' + list10['articles'][index]['publishedAt'], style: TextStyle(fontSize:10,color: Colors.blueGrey[400]))
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










        		]
        	)

        )
       ]
      )
    );
	}

}