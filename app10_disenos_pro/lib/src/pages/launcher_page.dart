import 'package:app10_disenos_pro/src/routes/routes.dart';
import 'package:app10_disenos_pro/src/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class LauncherPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter'),
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones(),
   );
  }
}

class _ListaOpciones extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.black,
        );
      },
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(pageRoutes[index].icon, color: appTheme.accentColor,),
        title: Text(pageRoutes[index].titulo),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoutes[index].page));
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  child: Text('VI', style: TextStyle(fontSize: 50),),
                ),
              ),
            ),

            Expanded(
              child: _ListaOpciones(),
            ),

            ListTile(
              leading: Icon(Icons.lightbulb, color: appTheme.currentTheme.accentColor),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme, 
                activeColor: appTheme.currentTheme.accentColor,
                onChanged: (value) {
                  appTheme.darkTheme = value;
                },
              ),
            ),

            ListTile(
              leading: Icon(Icons.add_to_home_screen, color: appTheme.currentTheme.accentColor),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: appTheme.customTheme, 
                activeColor: appTheme.currentTheme.accentColor,
                onChanged: (value) {
                  appTheme.customTheme = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}