# 実行流れ

## バックエンド

### インストール

* Windows: https://www.youtube.com/watch?v=TtCfDXfSw_0
* Windows なら　Sqlc　を無視！！
  
* Mac:
    * Docker をインストールする
    * Xcode をインストールする
    * homebrew をインストールする　＝＞ brew install golang-migrate

### Backend setup
* vscode に　plugin ： go , Makefile Tools, WSL をインストール
    cd Backend 
  　vscodeのターミナルはWSLを変更 に https://code.visualstudio.com/docs/remote/wsl
      コマンド :　sudo apt install make
  　　　　　　　　make dockernetwork
                make postgres
                (run docker postgres)
                make setup_info
                make setup_chat
                (入Data)

## フロントエンド
* flutter clean
* flutter upgrade
* flutter run

