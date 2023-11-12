# plugin

## vim-surround

- `ysw <character>` : `<character>` で囲む
- `ds <character>`: `<character>` を取り除く
- `cs <pre_character> <next_character>`: <pre_character> -> <next_character> に置換

## ReplaceWithRegister

- `yw`: コピー
- `grw`: コピーされたものに置換

## Comment

- `gcc`: カーソル行をコメントアウト
- `gc<number>j`: カーソルから `<number>` 行下にコメントアウト
- `gc<number>k`: カーソルから `<number>` 行上にコメントアウト

## telescope

- `<leader>ff`: ファイル名で検索
- `<leader>fs`: 特定の文字列で検索
- `<leader>`

# config vs opts

## from ChatGPT

```
opt（ロードの条件や方法）
opts は、プラグインの設定オプションを指定するためのテーブルまたは関数です。
opts に指定されたテーブルは、プラグインの config 関数に渡されます。
親スペック（parent specs）にマージされるテーブルを指定するか、親スペックを置き換えるテーブルを返す関数を指定できます。
opts を設定することで、プラグインの config が暗示されます（つまり、opts が指定されている場合、config が呼び出されることを意味します）。

config（プラグインの動作や設定）
config は、プラグインがロードされたときに実行される関数です。
デフォルトの実装では、プラグインのメインモジュール（MAIN module）に require を行い、setup 関数を opts で呼び出します。
lazy.nvim は、プラグイン名に基づいて自動的にメインモジュールを特定します。
opts を使用せずにデフォルトの実装を使いたい場合は、config を true に設定します。
この情報に基づいて、opts はプラグイン設定のオプション自体を指定するために使い、config はそれらのオプションをどのように適用するか、またはプラグインがロードされたときにどのような動作をするかを定義するために使用されます。したがって、opts で指定した設定オプションは、config 関数（またはデフォルトの setup 関数）によってプラグインに適用されます。

したがって、プラグインの設定を直接指定したい場合は opts を、その設定をどのようにプラグインに適用するかをカスタマイズしたい場合は config を使用します。また、config が true の場合は、opts に基づいてデフォルトの動作が行われます。

```
