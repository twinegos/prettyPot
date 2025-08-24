// Flutter Material Design 라이브러리 가져오기
import 'package:flutter/material.dart';

/// 앱의 진입점 - 애플리케이션 시작 함수
void main() {
  runApp(const MyApp()); // MyApp 위젯을 실행하여 앱 시작
}

/// 메인 앱 클래스 - StatelessWidget을 상속받는 불변 위젯
class MyApp extends StatelessWidget {
  /// 생성자 - key를 받아 부모 클래스에 전달
  const MyApp({super.key});

  /// 위젯 빌드 메서드 - 위젯의 UI를 정의하고 반환
  // 이 위젯이 애플리케이션의 루트입니다.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // 앱 제목 (태스크 스위처에서 표시)
      theme: ThemeData( // 앱의 전체 테마 설정
        // 이것이 애플리케이션의 테마입니다.
        //
        // 시도해보세요: "flutter run"으로 애플리케이션을 실행해보세요. 애플리케이션이
        // 보라색 툴바를 가지고 있는 것을 볼 수 있습니다. 그런 다음 앱을 종료하지 말고,
        // 아래 colorScheme의 seedColor를 Colors.green으로 변경하고
        // "hot reload"를 실행하세요 (변경 사항을 저장하거나 Flutter 지원 IDE에서 "hot
        // reload" 버튼을 누르거나, 명령줄에서 앱을 시작한 경우 "r"을 누르세요).
        //
        // 카운터가 0으로 재설정되지 않았다는 것을 알 수 있습니다. 애플리케이션
        // 상태는 reload 중에 손실되지 않습니다. 상태를 재설정하려면 대신 hot
        // restart를 사용하세요.
        //
        // 이것은 값뿐만 아니라 코드에서도 작동합니다: 대부분의 코드 변경은
        // hot reload만으로 테스트할 수 있습니다.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // 보라색 기반 색상 테마
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'), // 홈페이지 위젯 설정
    );
  }
}

/// 홈페이지 위젯 클래스 - StatefulWidget을 상속받는 상태가 있는 위젯
class MyHomePage extends StatefulWidget {
  /// 생성자 - key와 title을 매개변수로 받음
  const MyHomePage({super.key, required this.title});

  // 이 위젯이 애플리케이션의 홈페이지입니다. 이것은 stateful입니다, 즉
  // 외관에 영향을 주는 필드를 포함하는 State 객체(아래에 정의됨)를 가지고 있습니다.

  // 이 클래스는 state의 구성입니다. 부모(이 경우 App 위젯)에서 제공하고
  // State의 build 메서드에서 사용하는 값들(이 경우 title)을 보유합니다.
  // Widget 서브클래스의 필드는 항상 "final"로 표시됩니다.

  /// 페이지 제목을 저장하는 불변 필드
  final String title;

  /// State 객체 생성 메서드 - StatefulWidget에서 필수로 구현해야 함
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// MyHomePage의 State 클래스 - 실제 상태와 UI 로직을 담당
class _MyHomePageState extends State<MyHomePage> {
  /// 카운터 값을 저장하는 변수 (밑줄은 private 접근자를 의미)
  int _counter = 0;

  /// 카운터 증가 함수 - 버튼 클릭 시 호출됨
  void _incrementCounter() {
    setState(() { // UI 업데이트를 위해 setState 호출
      // setState 호출은 Flutter 프레임워크에게 이 State에서 무언가가
      // 변경되었다고 알려주며, 이는 아래의 build 메서드가 다시 실행되어
      // 업데이트된 값이 화면에 반영되도록 합니다. setState()를 호출하지 않고
      // _counter를 변경한다면, build 메서드가 다시 호출되지 않으므로
      // 아무것도 일어나지 않는 것처럼 보입니다.
      _counter++; // 카운터 값 1 증가
    });
  }

  /// 위젯 UI 구성 메서드 - 화면에 표시될 위젯들을 정의
  @override
  Widget build(BuildContext context) {
    // 이 메서드는 setState가 호출될 때마다 다시 실행됩니다,
    // 예를 들어 위의 _incrementCounter 메서드에서와 같이.
    //
    // Flutter 프레임워크는 build 메서드 재실행을 빠르게 하도록 최적화되어 있어서,
    // 위젯의 인스턴스를 개별적으로 변경하는 것보다는 업데이트가 필요한
    // 모든 것을 다시 빌드할 수 있습니다.
    return Scaffold( // 기본 Material Design 레이아웃 구조
      appBar: AppBar( // 상단 앱바
        // 시도해보세요: 여기서 색상을 특정 색상으로 변경해보세요 (예: Colors.amber)
        // 그리고 hot reload를 실행하여 AppBar가 색상을 변경하는 동안
        // 다른 색상들은 그대로 유지되는 것을 보세요.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // 테마의 역색상 사용
        // 여기서 App.build 메서드에서 생성된 MyHomePage 객체의 값을 가져와서
        // appbar의 제목으로 설정합니다.
        title: Text(widget.title), // 앱바 제목 설정
      ),
      body: Center( // 본문 영역을 중앙 정렬하는 위젯
        // Center는 레이아웃 위젯입니다. 하나의 자식을 가져와서
        // 부모의 중앙에 배치합니다.
        child: Column( // 자식 위젯들을 세로로 배치하는 레이아웃 위젯
          // Column도 레이아웃 위젯입니다. 자식들의 목록을 가져와서
          // 수직으로 배열합니다. 기본적으로 자식들에 맞게 수평으로 크기를 조정하고,
          // 부모만큼 높아지려고 합니다.
          //
          // Column은 자신의 크기 조정 방법과 자식 배치 방법을 제어하는
          // 다양한 속성들을 가지고 있습니다. 여기서는 mainAxisAlignment를 사용하여
          // 자식들을 수직으로 중앙에 배치합니다; 여기서 주축은 수직축입니다
          // Column이 수직이기 때문입니다 (교차축은 수평축입니다).
          //
          // 시도해보세요: "debug painting"을 호출하세요 (IDE에서 "Toggle Debug Paint"
          // 액션을 선택하거나, 콘솔에서 "p"를 누르세요), 각 위젯의 와이어프레임을 보세요.
          mainAxisAlignment: MainAxisAlignment.center, // 자식 위젯들을 세로 중앙 정렬
          children: <Widget>[ // 자식 위젯들의 리스트
            const Text('버튼을 누른 횟수:'), // 안내 텍스트 (const: 컴파일 타임 상수)
            Text( // 카운터 값을 표시하는 텍스트
              '$_counter', // 문자열 템플릿을 사용하여 카운터 값 표시
              style: Theme.of(context).textTheme.headlineMedium, // 큰 헤드라인 스타일 적용
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton( // 우하단 플로팅 액션 버튼
        onPressed: _incrementCounter, // 버튼 클릭 시 실행할 함수 지정
        tooltip: '증가', // 버튼 길게 누를 때 표시되는 툴팁
        child: const Icon(Icons.add), // 버튼 내부에 표시할 더하기 아이콘
      ), // 이 마지막 쉼표는 build 메서드의 자동 포맷팅을 더 좋게 만듭니다.
    );
  }
}
