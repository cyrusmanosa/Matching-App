# 実行流れ

## バックエンド

  
* Mac:
    * Docker をインストールする
    * Xcode をインストールする
    * homebrew をインストールする　＝＞ brew install golang-migrate

### Windows
#### インストール
* Windows: https://www.youtube.com/watch?v=TtCfDXfSw_0
* Windows なら　Sqlc　を無視！！
#### 流れ
* vscode に　plugin ： go , Makefile Tools, WSL をインストール
    * cd Backend 
  　* vscodeのターミナルはWSLのターミナルを変更 に https://code.visualstudio.com/docs/remote/wsl
    * 
      ### コマンド :
        # migrate (テーブル設定)
        * curl -L https://packagecloud.io/golang-migrate/migrate/gpgkey | apt-key add -
        * echo "deb https://packagecloud.io/golang-migrate/migrate/ubuntu/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/migrate.list
        * apt-get update
        * apt-get install -y migrate
          
        # makefile (カスタムコマンドファイル)
        * sudo apt install make
          
        # docker (設定)
        * make dockernetwork
        * make postgres (docker に postgres　を　インストール　COMMAND)
        * make setup_info
        * make setup_chat
        * make test
    ## server 起動
    * make server

## フロントエンド
* flutter clean
* flutter upgrade
* flutter run

