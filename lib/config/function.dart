import 'package:flutter/material.dart';

NavigateToNextPage(context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}
