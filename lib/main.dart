import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // このウィジェットはアプリケーションのルートです。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // これはアプリケーションのテーマです。
        //
        // 試してみてください: "flutter run"でアプリケーションを実行してみてください。
        // アプリケーションには紫色のツールバーがあります。その後、アプリを終了せずに、
        // 下のcolorSchemeのseedColorをColors.greenに変更して、
        // "hot reload"を実行してみてください（変更を保存するか、Flutter対応のIDEで
        // "hot reload"ボタンを押すか、コマンドラインでアプリを開始した場合は"r"を押します）。
        //
        // カウンターがゼロにリセットされないことに注意してください。
        // リロード中にアプリケーションの状態は失われません。状態をリセットするには、
        // hot restartを使用してください。
        //
        // これは値だけでなくコードにも適用されます: ほとんどのコード変更は
        // hot reloadでテストできます。
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // このウィジェットはアプリケーションのホームページです。
  // 状態を持つため、Stateオブジェクト（以下で定義）があり、
  // その見た目に影響を与えるフィールドを含んでいます。

  // このクラスは状態の設定です。親（この場合はAppウィジェット）から提供され、
  // Stateのbuildメソッドで使用される値（この場合はタイトル）を保持します。
  // Widgetサブクラスのフィールドは常に"final"とマークされます。

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _logger = Logger();

  void _incrementCounter() {
    setState(() {
      // このsetStateの呼び出しは、FlutterフレームワークにこのStateで何かが
      // 変更されたことを伝え、以下のbuildメソッドを再実行させ、
      // 表示が更新された値を反映できるようにします。
      // setState()を呼び出さずに_counterを変更した場合、
      // buildメソッドは再度呼び出されず、何も起こらないように見えます。
      _counter++;
      _logger.i('カウンターが増加しました');
    });
  }

  @override
  Widget build(BuildContext context) {
    // このメソッドは、setStateが呼び出されるたびに再実行されます。
    // 例えば、上記の_incrementCounterメソッドによって呼び出されます。
    //
    // Flutterフレームワークは、buildメソッドを再実行することを最適化しているため、
    // 更新が必要なものを再構築するだけで済み、ウィジェットのインスタンスを
    // 個別に変更する必要はありません。
    return Scaffold(
      appBar: AppBar(
        // 試してみてください: ここで色を特定の色（例えばColors.amber）に変更し、
        // hot reloadをトリガーして、AppBarの色が他の色が同じままで変わるのを見てください。
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // ここでは、App.buildメソッドによって作成されたMyHomePageオブジェクトから
        // 値を取得し、それをappbarのタイトルに設定します。
        title: Text(widget.title),
      ),
      body: Center(
        // Centerはレイアウトウィジェットです。単一の子を取り、
        // 親の中央に配置します。
        child: Column(
          // Columnもレイアウトウィジェットです。子のリストを取り、
          // 垂直に配置します。デフォルトでは、子に合わせて横方向にサイズを調整し、
          // 親と同じ高さになろうとします。
          //
          // Columnには、サイズを調整する方法や子を配置する方法を制御する
          // さまざまなプロパティがあります。ここでは、mainAxisAlignmentを使用して
          // 子を垂直に中央に配置しています。ここでの主軸は垂直軸です。
          // Columnは垂直だからです（交差軸は水平になります）。
          //
          // 試してみてください: "デバッグペイント"を呼び出して（IDEで
          // "Toggle Debug Paint"アクションを選択するか、コンソールで"p"を押します）、
          // 各ウィジェットのワイヤーフレームを見てください。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'ボタンを押した回数:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'インクリメント',
        child: const Icon(Icons.add),
      ), // この末尾のカンマは、buildメソッドの自動フォーマットをより良くします。
    );
  }
}
