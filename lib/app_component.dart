// Copyright (c) 2017, tatsu. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:html';
import 'package:angular2/core.dart';

@Component(
  selector: 'my-app',
  template: '<h1>{{hello.message}}</h1>'
)
class AppComponent {
  Hello hello = new Hello();
}

class Hello{

  String message;

  Hello(){
    HttpRequest.getString('/api/hello')
        .then((String content) {
      Map parsedMap = JSON.decode(content);
      message = parsedMap["Message"];
    })
        .catchError((Error error) {
      print(error.toString());
    });
  }
}
