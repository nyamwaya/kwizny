import 'package:flutter/material.dart';

/*
 * In order to use the BLoC pattern, the BLoc needs to be accesible.
 * For this app, we do so by useing the most comman way of doing so
 * via an ancestor Widget, implemented as a StatefulWIdget.
 * 
 * 
 * 
 * Children will instantiate a new BlocProvider which 
 * will handle the given bloc and will render the given page as a child
 * 
 * From that moment on, any widget part of the sub-tree, starting at BlocProvider
 * will be able to get access to said child Bloc via the follwing line
 * 
 * IncrementBloc bloc = BlocProvider.of<IncrementBloc>(context);
 * 
 * For more see
 * https://www.didierboelens.com/2018/08/reactive-programming---streams---bloc/
 */

// Generic Interface for all BLoCs
// abstract class BlocBase {
//   void dispose();
// }

// // Generic BLoC provider
// class BlocProvider<T extends BlocBase> extends StatefulWidget {
//   BlocProvider({
//     Key key,
//     @required this.child,
//     @required this.bloc,
//   }): super(key: key);

//   final T bloc;
//   final Widget child;

//   @override
//   _BlocProviderState<T> createState() => _BlocProviderState<T>();

//   static T of<T extends BlocBase>(BuildContext context){
//     final type = _typeOf<BlocProvider<T>>();
//     BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
//     return provider.bloc;
//   }

//   static Type _typeOf<T>() => T;
// }

// class _BlocProviderState<T> extends State<BlocProvider<BlocBase>>{
//   @override
//   void dispose(){
//     widget.bloc.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context){
//     return widget.child;
//   }
// }

//New Implementation

Type _typeOf<T>()=> T;

abstract class BlocBase {
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget{

  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }): super(key: key);

  final Widget child;
  final T bloc;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context){
    final type = _typeOf<_BlocProviderInherited<T>>();
    _BlocProviderInherited<T> provider = context.ancestorInheritedElementForWidgetOfExactType(type)?.widget;
    return provider?.bloc;
  }
}

class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>>{
  @override
  void dispose(){
    widget.bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return new _BlocProviderInherited<T>(
      bloc: widget.bloc,
      child: widget.child
    );
  }
}

class _BlocProviderInherited<T> extends InheritedWidget{
  _BlocProviderInherited({
    Key key,
    @required Widget child,
    @required this.bloc,
  }) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) => false;

}
