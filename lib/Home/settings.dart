import 'package:flutter/material.dart';
import 'package:triveous/Home/search.dart';

class Settings extends StatefulWidget {
	@override
	_SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  var isDark = true;
  void changetoDark() async {
       if(isDark){
         setState((){

          isDark= false;
          });
       } else {
        setState((){

          isDark= true;
          });
      }
      
  }


  @override
  void initState(){

  }
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: (!isDark) ? Colors.black : Colors.white,
      ),
      home:Scaffold(
			appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: (!isDark) ? Colors.black : Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Container(
              
          
                child: InkWell(
                
                  child: SizedBox(width: 40, height: 40, child: Icon(Icons.arrow_back, color: (!isDark) ? Colors.white : Colors.black)),
                  onTap: () {
                    Navigator.of(context).pop();
                    },
                ),
              
                
              ),
              Container(
              child:Text('Settings', style:TextStyle(color:(!isDark) ? Colors.white : Colors.black)),
              ),
              Container(
                child: Text('')
              ),
            
            ]
          ),
        
        ),//AppBar 
			  body: ListView( 
          children: <Widget>[

          InkWell(
            onTap:(){
            // Navigator.push(context, MaterialPageRoute(builder:(context)=>new HomePage()));
            },
            child: ListTile(
              title: Text('General', style : TextStyle(color: (!isDark) ? Colors.white : Colors.black)),
              leading: Icon(Icons.menu ,color: (!isDark) ? Colors.white : Colors.black),

            ),//ListTile
          ),//InkWell
          InkWell(
            onTap:(){},
            child: ListTile(
              title: Text('Privacy ans Security', style : TextStyle(color: (!isDark) ? Colors.white : Colors.black)),
              leading: Icon(Icons.security ,color: (!isDark) ? Colors.white : Colors.black),
            ),//ListTile
          ),//InkWell
          InkWell(
            onTap:(){},
            child: ListTile(
              title: Text('Account', style : TextStyle(color: (!isDark) ? Colors.white : Colors.black)),
              leading: Icon(Icons.person ,color: (!isDark) ? Colors.white : Colors.black),

            ),//ListTile
          ),//InkWell
          InkWell(
            onTap:(){
              Navigator.push(context,MaterialPageRoute(builder: (context) => Search()),);
              },
            child: ListTile(
              title: Text('Search', style : TextStyle(color: (!isDark) ? Colors.white : Colors.black)),
              leading: Icon(Icons.search ,color: (!isDark) ? Colors.white : Colors.black),

            ),//ListTile
          ),//InkWell
         
          Divider(),
          InkWell(
            onTap:(){},
            child: ListTile(
              title: Text('About', style : TextStyle(color: (!isDark) ? Colors.white : Colors.black)),
              leading: Icon(Icons.help ,color: (!isDark) ? Colors.white : Colors.black),

            ),//ListTile   
          ),//InkWell
          InkWell(
            onTap:(){},
            child: ListTile(
              title: Text('Log Out', style : TextStyle(color: (!isDark) ? Colors.white : Colors.black)),
              leading: Icon(Icons.close ,color: (!isDark) ? Colors.white : Colors.black),

            ),//ListTile
          ),//InkWell
          Divider(),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Center(child: Text('Developed by', style: TextStyle(fontSize: 13, color: Colors.grey[700])))
                ),
                Container(
                  child: Center(child: Text('Juned Raza',style: TextStyle(fontSize: 17, color: Colors.grey[700])))
                ),
                 Container(
                  child: Center(child: Text('Version: 1.0.0+1',style: TextStyle(fontSize: 13, color: Colors.grey[700])))
                ),
                
              ]
            )
          )

          ],//Widget
        ),//ListView
      )
		);
	}
}
