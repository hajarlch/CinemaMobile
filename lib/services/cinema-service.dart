import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CinemaService {
  static String host = 'http://10.16.0.174:8090';

  Future getVilles() {
    String url = host + '/villes';
    return http.get(Uri.parse(url));
  }

  Future getCinemas(href) {
    String url = href;
    return  http.get(Uri.parse(url));
  }

  Future getphoto(href) {
    String url = href;
    return  http.get(Uri.parse(url));
  }
  Future getSalles(href) {
    String url = href;
    return  http.get(Uri.parse(url));
  }
  Future getProjections(href) {
    String url = href+'?projection=p1';
    return http.get(Uri.parse(url));
  }

  getTickets(href) {
    String url = href +'?projection=ticketProj';
    return http.get(Uri.parse(url));
  }
  Future postTickets(ticketFrom) async{
    String url = host + '/payerTickets2';

    final http.Response response = await http.post(Uri.parse(url),
        headers:{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(ticketFrom));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update album.');
    }

    }

}
