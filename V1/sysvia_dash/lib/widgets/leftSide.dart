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
              SizedBox(height: 200),
              Row(
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: const Text(
                            'SysVia ENTERPRISE',
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 5, 0, 30),
                          child: const Text(
                            'SEU FLUXO DE TRABALHO UNIFICADO E ESCALÁVEL - TUDO EM UM SÓ LUGAR',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        OutlinedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.fromLTRB(40, 15, 40, 15)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Color.fromARGB(255, 53, 140, 211),
                                      width: 2,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
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
