import 'package:flutter/material.dart';
import 'package:newproviders/src/pages/tab1_page.dart';
import 'package:newproviders/src/pages/tabs2_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          title: Text('Para ti')
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.public),
            title: Text('Encabezados')
        )
      ],
    );
  }
}



class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      //physics: BouncingScrollPhysics(),
      children: <Widget>[
        Tab1Page(),
        Tab2Page()
      ],
    );
  }
}


class _NavegacionModel with ChangeNotifier{
  
  int _paginaActual = 0;
  PageController _pageController = PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor){
    this._paginaActual = valor;
    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;

}
