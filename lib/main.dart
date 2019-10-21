import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'second_page.dart';
import 'bloc_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String a = "0";

  ///把stream直接包装成Observable
//  var obs = Observable(Stream.fromIterable([1,2,3,4,5]));

  ///通过Future创建：fromFuture
//  var obs = Observable.fromFuture(new Future.value("Hello"));

  ///让流的“吐”出间隔一段时间：interval
//  var obs = Observable(Stream.fromIterable([1,2,3,4,5]))
//      .interval(new Duration(seconds: 1));

  ///迭代地处理数据：map
  ///map方法能够让我们迭代的处理每一个数据并返回一个新的数据
//  var obs = Observable(Stream.fromIterable([1,2,3,4,5]))
//      .map((item)=>++item);

  ///扩展流：expand
  ///expand方法能够让我们把把每个item扩展至多个流
//  var obs = Observable(Stream.fromIterable([1,2,3,4,5]))
//      .expand((item)=> [item,item.toDouble()]);

  ///合并流：merge
  ///merge方法能够让我们合并多个流,请注意输出。
//  var obs = Observable.merge([
//    Stream.fromIterable([1,2,3]),
//    Stream.fromIterable([4,5,6]),
//    Stream.fromIterable([7,8,9]),
//  ]);

  ///顺序执行多个流：concat
  ///concat方法能够让我们按照顺序执行一组流，当一组流执行完毕后，再开始执行下一组。
//    var obs = Observable.concat([
//    Stream.fromIterable([1,2,3]),
//    Stream.fromIterable([4,5,6]),
//    Stream.fromIterable([7,8,9]),
//  ]);

  ///检查每一个item：every
  ///every会检查每个item是否符合要求，然后它将会返回一个能够被转化为 Observable 的 AsObservableFuture< bool>。
//  var obs = Observable.fromIterable([1, 12, 3, 4, 5]);

  ///Dart中 Observables 默认是单一订阅。如果您尝试两次收听它，则会抛出 StateError 。
  ///你可以使用工厂方法或者 asBroadcastStream 将其转化为多订阅流。
//  var obs = Observable(Stream.fromIterable([1,2,3,4,5])).asBroadcastStream();

  ///增强版StreamController——Subject
  ///缓存最新一次事件的广播流控制器：BehaviorSubject
//  final subject = new BehaviorSubject<int>();

  ///缓存更多事件的广播流控制器：ReplaySubject
  ///ReplaySubject能够缓存更多的值，默认情况下将会缓存所有值，并在新的收听的时候将记录下的事件作为第一帧发送给收听者。
//  final subject = ReplaySubject<int>();

  ///你还可以通过maxSize控制缓存个数
//  final subject = ReplaySubject<int>(maxSize: 2);

  @override
  Widget build(BuildContext context) {
//        obs.listen((_){
//          a=_.toString();
//          setState(() {
//          });
//
//        });
//    obs.every((x) => x < 10).asObservable().listen(print);

//    subject.add(1);
//    subject.add(2);
//    subject.stream.listen(print);// prints 2
//    subject.add(3);
//
//    subject.stream.listen(print); // prints 3
//    subject.stream.listen(print);

//    subject.add(1);
//    subject.add(2);
//    subject.add(3);
//
//
//
//    subject.stream.listen(print); // prints 1
//    subject.stream.listen(print); // prints 1
//    subject.stream.listen(print);

    final bloc = BlocProvider.of(context);

    return MaterialApp(
        title: 'Flutter RxDart',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Center(
            child: StreamBuilder<int>(
                stream: bloc.stream,
                initialData: bloc.value,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  return Text(
                    'You hit me: ${snapshot.data} times',
                    style: Theme.of(context).textTheme.display1,
                  );
                }),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.navigate_next),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => UnderPage()))),
        ));
  }
}
