import 'package:flutter/material.dart';
import 'package:newproviders/src/models/news_models.dart';
import 'package:newproviders/src/theme/tema.dart';

class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;

  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (BuildContext context, int index){
        return _Noticia(noticia: this.noticias[index], index: index);
      },
    );
  }
}


class _Noticia extends StatelessWidget {

  final Article noticia;
  final int index;

  const _Noticia({
    @required this.noticia,
    @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TarjetaTopBar(noticia: noticia, index: index),
        _TarjetaTitulo(noticia: noticia, index: index),
        _TarjetaImagen(noticia: noticia, index: index),
        _TarjetaBody(noticia: noticia, index: index),
        _TarjetaBotones(),
        SizedBox(height: 10,),
        Divider(),
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          RawMaterialButton(
            child: Icon(Icons.star_border),
            onPressed: (){},
            fillColor: miTema.accentColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          SizedBox(width: 10,),
          RawMaterialButton(
            child: Icon(Icons.settings),
            onPressed: (){},
            fillColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          )

        ],
      ),
    );
  }
}


class _TarjetaTopBar extends StatelessWidget {

  final Article noticia;
  final int index;

  const _TarjetaTopBar({
    @required this.noticia,
    @required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text('${index + 1}', style: TextStyle(color: miTema.accentColor),),
          Text(' ${noticia.source.name}',)
        ],
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {

  final Article noticia;
  final int index;

  const _TarjetaTitulo({
    @required this.noticia,
    @required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticia.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    );
  }
}


class _TarjetaImagen extends StatelessWidget {

  final Article noticia;
  final int index;

  const _TarjetaImagen({
    @required this.noticia,
    @required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: (noticia.urlToImage != null)
            ? FadeInImage(
            placeholder: AssetImage('assets/img/giphy.gif'),
            image: NetworkImage(noticia.urlToImage),
          )
          : Image(image: AssetImage('assets/img/no-image.png'),),
        ),
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {

  final Article noticia;
  final int index;

  const _TarjetaBody({
    @required this.noticia,
    @required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
          (noticia.description != null)
              ? noticia.description
              : ''
      ),
    );
  }
}


