" PHP用の設定

"" :make でシンタックスチェック
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l


let php_sql_query = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_folding = 0
"au Syntax php set fdm=syntax
"
