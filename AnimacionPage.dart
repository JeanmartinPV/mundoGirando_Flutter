
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnimacionPage extends StatefulWidget {
  AnimacionPage({Key key}) : super(key: key);

  @override
  _AnimacionPageState createState() => _AnimacionPageState();
}

class _AnimacionPageState extends State<AnimacionPage> with SingleTickerProviderStateMixin{
  
  //Definimos el controlador de la animación
  AnimationController _controlador;
  
  //Sobrescribimos el metodo Init State
  @override     
  void initState() {
    //Establecemos valores al controlador cuando se esta iniciando la app
    _controlador = AnimationController(
      vsync: this, //proveedor del ticker
      duration: const Duration(seconds: 30) //duracion de la animación
    );
    //utilizamos el metodo repeat para obtener el giro infinito(bucle)
    _controlador.repeat();
    super.initState();
  }

  //Sobrescribimos el metodo dispose, para destruir el controlador.
  @override
  void dispose() {
    _controlador.dispose(); //Destruimos el controlador
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        fit: StackFit.expand,
        children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xFF1D2343)
          ),

        Positioned.fill(
               top: -300,
               left: -300,
               right: -300,
               bottom: -300,

                child:  AnimatedBuilder(
                        animation: _controlador,//utilizamos el controlador en la animación
                        builder: (context, child){ //en el builder pondremos nuestro codigo para rotar el widget
                        //Para generar el giro, utilizamos el widget TRANSFORM.ROTATE
                        return Transform.rotate(
                        //Jugamos con el angulo, y multiplicamos el valor del controlador por PI y por 2.
                                  angle: _controlador.value * 2 * pi, 
                        //En el child ponemos child que es el del AnimatedBuilder
                                  child: child,
                        );
                  },
                child: Container(
                        child: Image( 
                          image:  AssetImage('assets/img/estrella.gif'), 
                          fit: BoxFit.cover) ),
                    ),
                ),

        Positioned(
          top: 0,
          child: 
          AnimatedBuilder(
          animation: _controlador,
          builder: (context, child){
                return Transform.rotate(angle: _controlador.value * 2 * pi, child: child,);
          },
          child: Container(
              padding: EdgeInsets.all( 20.0),
              decoration: BoxDecoration(
              shape: BoxShape.circle, 
              boxShadow: <BoxShadow> [
                            BoxShadow(
              color: Colors.blue.withOpacity(0.2),
              blurRadius: 25.0, //Para difuminar el color
              spreadRadius: 300.0, //La distancia del radio

              ),
              BoxShadow(
              color: Colors.white.withOpacity(0.1),
              blurRadius: 25.0, //Para difuminar el color
              spreadRadius: 70.0, //La distancia del radio

              ),
               BoxShadow(
              color: Colors.lightBlue.withOpacity(0.8),
              blurRadius: 30.0, //Para difuminar el color
              spreadRadius: 10.0, //La distancia del radio
              )
            ],

              ),
              height: 300,
              width: 300,
              child: Image( image:  AssetImage('assets/img/tierra.png'),)
            ),
      ),
        ),
          
           Image(
             alignment: Alignment.bottomCenter,
              image: AssetImage('assets/img/astronautasolo.png'), 
              height: double.infinity, 
              width: double.infinity, 
              ),
        ],
      )
    );
  }
}