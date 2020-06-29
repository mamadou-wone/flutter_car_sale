import 'package:flutter/material.dart';

class UpdatableScrollView extends StatelessWidget{
  final List<Widget> listWidget;
  final VoidCallback updatMethod;
  final ScrollController scrollController;

  UpdatableScrollView({
    @required this.listWidget,
    @required this.updatMethod,
    this.scrollController 
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: this.updatMethod,
      displacement: 30.0,
      child: SingleChildScrollView(
        controller: this.scrollController,
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(children:  this.listWidget),
      ),
    );
  }

}