実行流れ：
バックエンド

  インストール
    Window : https://www.youtube.com/watch?v=TtCfDXfSw_0
    Mac : Docker install
          Xcode install
          brew install golang-migrate
  Backend setup (vscode terminal or cmd)
    cd Backend 
      コマンド : make dockernetwork
                make postgres
                (run docker postgres)
                make setup_info
                make setup_chat
                (入Data)

フロントエンド
  flutter clean
  flutter upgrade
  flutter run
