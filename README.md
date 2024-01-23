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
    * cd Backend 
  　* vscodeのターミナルはWSLを変更 に https://code.visualstudio.com/docs/remote/wsl
      ### コマンド :
        # migrate
        * curl -L https://packagecloud.io/golang-migrate/migrate/gpgkey | apt-key add -
        * echo "deb https://packagecloud.io/golang-migrate/migrate/ubuntu/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/migrate.list
        * apt-get update
        * apt-get install -y migrate
          
        # makefile
        * sudo apt install make
          
        # docker install
        * make dockernetwork
        * make postgres (docker に postgres　を　インストール　COMMAND)
        * make setup_info
        * make setup_chat
        * (入Data)

## フロントエンド
* flutter clean
* flutter upgrade
* flutter run

