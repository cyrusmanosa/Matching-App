# 実行流れ

## バックエンド

### インストール

* Windows: https://www.youtube.com/watch?v=TtCfDXfSw_0
* Mac:
    * Docker をインストールする
    * Xcode をインストールする
    * brew install golang-migrate

### Backend setup

* vscode のターミナルまたは cmd で、以下のコマンドを実行する
* vscode に　plugin ： go , Makefile Tools, WSL をインストール
    cd Backend 
      コマンド : make dockernetwork
                make postgres
                (run docker postgres)
                make setup_info
                make setup_chat
                (入Data)

## フロントエンド
* flutter clean
* flutter upgrade
* flutter run

