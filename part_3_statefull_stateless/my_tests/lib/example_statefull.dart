import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ExampleLifeCycles extends StatefulWidget {
  ExampleLifeCycles({Key? key}) : super(key: key);

  @override
  _ExampleLifeCyclesState createState() => _ExampleLifeCyclesState();
}

class _ExampleLifeCyclesState extends State<ExampleLifeCycles> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
                child: Text("Click"),
                onPressed: () {
                  setState(() {
                    print('SET STATE');
                    counter++;
                    print('NEW VALUE COUNTER: ${counter}');
                    print('==========================');
                  });
                }),
            if (counter < 5) CounterWidget(counter: counter),
          ],
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  CounterWidget({Key? key, required int this.counter}) : super(key: key);

  final int counter;

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  void initState() {
    super.initState();
    print('INIT STATE');
    print('==========================');

    //Этот callback вызывается только один раз.
    //Позволяет удостовериться, что сборка виджета завершена.
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      print('POST FRAME CALLBACK');
      print('Brightess: ${Theme.of(context).brightness}');
      print('Size: ${MediaQuery.of(context).size.width}');
      print('==========================');
    });

    @override
    void didChangeDependencies() {
      super.didChangeDependencies();

      print('==DID Change Dependencies');
      print('Brightess: ${Theme.of(context).brightness}');
      print('Size: ${MediaQuery.of(context).size.width}');
      print('==========================');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('BUILD');
    print('==========================');
    return Center(
      child: Column(children: <Widget>[
        Container(
          child: Text('Counter ${widget.counter}'),
        ),
        HomeViewCounter(counter: widget.counter),
      ]),
    );
  }

  //Вызовется после того, как родительский виджет передаст
  //новые пропсы и виджеты нужно будет перестроиться.
  //В параметрах будет oldWidget super.didUpdateWidget(oldWidget);
  //его можно будет сравнить с текущим виджетом, чтобы выполнить дополнительную логику.
  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('DID UPDATE WIDGET: ${oldWidget}');
    print('OLD VALUE COUNTER: ${oldWidget.counter}');
    print('==========================');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('DEACTIVATE');
    print('==========================');
  }

  @override
  void dispose() {
    super.dispose();
    print('DISPOSE');
    print('==========================');
  }
}

class HomeViewCounter extends StatelessWidget {
  HomeViewCounter({Key? key, required this.counter}) : super(key: key);

  final int counter;

  @override
  Widget build(BuildContext context) {
    print('BUILD COUNTER');
    print('==========================');
    return Text('Stateless widget counter: $counter');
  }
}
