import 'package:flutter/material.dart';

class PageContent extends StatelessWidget {

  final Widget content;

  PageContent({ required this.content});

  @override
  Widget build(BuildContext context) {
    return  content;
  }
}
