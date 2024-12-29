# go_router_builder

go_router_builderパッケージはgo_routerに「型安全」と「ページ遷移の簡略化」を追加したものです。以下で詳しく解説します。

## 型安全性

go_routerでクエリパラメータやパスパラメータを使用したいとき、String型でしか受け取れません。これによって型安全を保証することが難しかのです。例えば、以下のようにid(int型)を受け取りたいのに文字列(String)を受け取ってしまうとします。しかし、これはruntime（アプリが実行中）にしか感知できないので問題です。
```Dart
// URL->https://example.com/users/42a
GoRoute(
  path: ':userId',
  builder: (BuildContext context, GoRouterState state) {
    // Require the userId to be present and be an integer.
    final int userId = int.parse(state.pathParameters['userId']!);
    return UserScreen(familyId);
  },
);
```
これをgo_router_builderでは型を保証した上で受け取れるので、開発中にエラーがない場合はアプリ実行中にエラーが出ることは無くなります。

## ページ遷移の簡略化

go_routerではページを遷移するとき、routerで指定したURLを毎回直接打ち込まなければいけません。これはとても冗長であり、また意図しないエラーを招くことがあります。以下のようなコードによって遷移をします。

```Dart
context.go('/dashboard/tasks/2');
```

これをgo_router_builderを使えば、URLを入力する必要はなくなります。必要なのは、そのページが指定した型に沿ったパラメータを指定するだけです（パラメータがが必要な場合）。

# 準備の方法

ここからは、go_router_builderを使うための方法を簡単に解説します。

## ルートを設定する

まずはどのようなルーティングになっているのかを設定します。単純なルーティングも設定は可能ですが、多くのアプリはナビゲーションを含んだレイアウトが必須なので今回はShellRouteを含んだ実装をしています。

実装は[router.dart](https://github.com/honganji/Flutter-Hub/blob/main/lib/go_router_builder/route/router.dart)に書いてあります。ここには、ShellRouteの記述のみをしています。[go_router_builderの公式サイト](https://pub.dev/packages/go_router_builder)では全てのルーティング情報をrouterファイルに書き込んでいますが、プロジェクトが大きくなると修正が難しくなると思います。なので、本プロジェクトでは各ページのディレクトリに「〇〇_route.dart」という形式のファイルを置いて記述しています。

## 各ルートの記述

基本的には書くパスで指定したルートデータに対応する画面を指定します。例えば、ホーム画面のルート[home_route.dart](https://github.com/honganji/Flutter-Hub/blob/main/lib/go_router_builder/ui/shell_route/sub_screens/home/home_route.dart)のような記述になります。

余談なのですが、Reactive UIは現代では必須となります。私は画面の幅でUIを変えるようにしています。なので、extensionキーワードを使ってcontextに画面の大きさでデスクトップサイズなのかモバイルサイズなのかを比較できる機能を[extension_buildcontext.dart](https://github.com/honganji/Flutter-Hub/blob/main/lib/go_router_builder/extension/extension_buildcontext.dart)に追加しました。

## コードの自動生成

最も重要なのは指定のコマンドを実行することで、コードを自動生成することです。これはMakefileに記述しているのでコマンドの詳細はMakefileを見てみてください。実行時は以下のコマンドを実行してください。

```Makefile
// 生成されたコード(〇〇.g.dart)がない場合
make gen

// 生成されたコードを再生成する場合
make gen_all
```

## 設定したルートをアプリに適応させる

[app.dart](https://github.com/honganji/Flutter-Hub/blob/main/lib/go_router_builder/app.dart)に記述されているように、設定してください。特にエラービルダーを指定するのをお勧めします。自分が指定したエラーページを指定することでよりUI・UXが改善されます。

## ページ遷移

最後にページ遷移をするための方法を説明します。[desktop_shell_route_screen.dart](https://github.com/honganji/Flutter-Hub/blob/main/lib/go_router_builder/ui/shell_route/desktop/desktop_shell_route_screen.dart)で記述されているように、各ルートのために設定されたインスタンスの「go」関数を実行することで遷移することができます。go_routerのようにパスを指定する必要がないため、誤ったパスのせいで意図しないページに遷移したり、存在しないページに遷移することはありません。

