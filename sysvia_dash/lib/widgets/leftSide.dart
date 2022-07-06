import 'package:flutter/material.dart';

class LeftSide extends StatelessWidget {
  const LeftSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 5,
      child: Container(
        // color: Color(0xff292929),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/bg.jpg'),
          fit: BoxFit.cover,
        )),
        child: Container(
          margin: EdgeInsets.fromLTRB(100, 50, 0, 30),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      width: 120,
                      child: Image.asset('images/invision_logo_white.png'))
                ],
              ),
              SizedBox(height: 200),
              Row(
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'SysVia ENTERPRISE',
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 30),
                          child: Text(
                            'SEU FLUXO DE TRABALHO UNIFICADO E ESCALÁVEL - TUDO EM UM SÓ LUGAR',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: Text(
                            'SysVia orientada a inovação.',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        OutlinedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.fromLTRB(40, 15, 40, 15)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Color.fromARGB(255, 33, 150, 243),
                                      width: 2,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Saiba Mais',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
