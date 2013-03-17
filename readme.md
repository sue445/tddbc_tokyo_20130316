# お題 [![Build Status](https://travis-ci.org/sue445/tddbc_tokyo_20130316.png)](https://travis-ci.org/sue445/tddbc_tokyo_20130316)
## 1枚目
```
class LTSV {
  set(String key, String val) : String
  get(String key) : String
  dump() : String
}

ltsv = new LTSV();
ltsv.set( "foo", "hoge" ) #=> null
ltsv.get( "foo" )         #=> "hoge"
ltsv.dump()               #=> "foo:hoge\n"

ltsv.set( "bar", "fuga")  #=> null
ltsv.dump()               #=> "foo:hoge\tbar:fuga\n"

ltsv.set( "foo", "piyo")  #=> "hoge"
                          #     ↑ 置き換えられた値

ltsv.dump()               #=> "bar:fuga\tfoo:piyo\n"
                          #     ↑ 格納順にダンプされる
```

## 2枚目
```
// 例外条件を考えてみよう

ltsv.get( "toto" )      #=> 存在しないキーの値はnull
ltsv.set( nil  , "momo" ) # nullキーは例外発生
ltsv.set( ""   , "gogo" ) # 空文字キーは例外発生
ltsv.set( "key", null )   # null値は例外発生
ltsv.set( "key", "" )     # 空文字値はOK -> dumpは?

// データにコロンが入ってたら?
// データに改行が入っていたら?
// データにタブ文字が入っていたら?
     #=> 上記は全てバックスラッシュでエスケープ
```

## 3枚目
```
「いやー和田くん、こないだのLTSV、だっけ？」
「はい」
「ステキなんだけど、もうちょっと便利にしたいなぁ」
「はい（なんだろう・・・）」
「dumpがあるなら読み込みも欲しいよね」
「えっ」

// 読み込んでみよう
LTSV.parse(String dumpStr) : LTSV

例：
ltsv = LTSV.parse( "foo:hoge\tbar:fuga\n" )
ltsv.get( "foo" ) #=> "hoge"
ltsv.get( "bar" ) #=> "fuga"

// さて例外系はどうしましょう?
```
