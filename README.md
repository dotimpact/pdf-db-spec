# pdf-db-spec
mysqlの既存テーブルからpdfのドキュメントを作ります。

[![https://gyazo.com/accf2d80292eabb6176c2811b2865328](https://i.gyazo.com/accf2d80292eabb6176c2811b2865328.png)](https://gyazo.com/accf2d80292eabb6176c2811b2865328)

[![https://gyazo.com/39fbd74d691b417cbed3e3d665b5fea1](https://i.gyazo.com/39fbd74d691b417cbed3e3d665b5fea1.png)](https://gyazo.com/39fbd74d691b417cbed3e3d665b5fea1)

# 依存アプリケーション
- mysql
- [wkhtmltopdf](https://wkhtmltopdf.org/)

# インストール
```
$ git clone git@github.com:dotimpact/pdf-db-spec.git
$ cd pdf-db-spec
$ cp db.yml.dst db.yml
```
`db.yml` を環境と書き出したいテーブルに合わせて書き換えます。

# 実行
```
$ ruby makespec.rb
```
`pdf`フォルダにpdfが生成されます。

# 参考
- [続・MySQL データベースからテーブル定義書を生成する \- 私と私の猫の他は誰でも隠し事を持っている](http://mariyudu.hatenablog.com/entry/2015/02/01/200517)
  - xsltと書き出しhtmlのスタイルを全面的に利用させてもらいました。
- [MySQLのテーブルを好きな形式（XML/HTML/SQL）で取り出したり、データをちょっと取り出して実験したいときのテクニック \- それマグで！](http://takuya-1st.hatenablog.jp/entry/20120501/1335894519)
