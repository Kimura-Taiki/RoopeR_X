<!-- 脚本系統のMCVが粗方出来たので、ようやく惨劇系統の実装、とりあえず脚本から惨劇セットアップに写像を撮る際に何が必要かを考察してみたい -->

# 座系統のモデル
## Za(キャラクターの座)
### 属性
* name
* paranoia_limit
* image_id
* 
### 隷下
* Ability
* Za_Category_Attribution
* Pawn
* 

## Ability(能力)
### 属性
* condition
* 

## Category(キャラの属性)
### 属性
* name
* 
### 隷下
* Za_Category_Attribution
* 

## Za_Category_Attribution(座属性間交差テーブル)
### 属性
* Za_id
* Category_id
* 



# 脚本系統のモデル
## Script(脚本)
### 属性
* name
* noof_days
* noof_weeks
* 
* Package_id
* 
### 隷下
* Pawn
* Incident
* Script_Rule_Contract
* Tragedy
* 

## Script_Rule_Contract(脚本ルール間交差テーブル)
### 属性
* Script_id
* Rule_id
* 

## Pawn(駒)
### 属性
* 
* Script_id
* Za_id
* Position_id
* 
### 隷下
* Incident
* 

## Incident(事件)
### 属性
* day
* 
* Script_id
* Pawn_id
* Crime_id
* 



# 惨劇セット系統のモデル
## Package(惨劇セット)
### 属性
* name
* 
### 隷下
* Package_Crime_Own
* Package_Rule_Own
* Package_Position_Own
* Script
* 

## Crime(犯罪の構成要件)
### 属性
* name
* shift
* counter
* 
### 隷下
* Package_Crime_Own
* 

## Package_Crime_Own(セット犯罪間交差テーブル) 
### 属性
* Package_id
* Crime_id
* 

## Rule(ルール)
### 属性
* name
* xy
* 
### 隷下
* Package_Rule_Own
* Rule_Position_Own
* 

## Package_Rule_Own(セットルール間交差テーブル)
### 属性
* Package_id
* Rule_id
* 

## Position(役職)
### 属性
* name
* max
* refusal
* unkillable
* obstinate
* 
### 隷下
* Package_Position_Own
* Rule_Position_Own
* 

## Package_Position_Own(セット役職間交差テーブル)
## 属性
* Package_id
* Position_id
* 

## Rule_Position_Own(ルール役職間交差テーブル)
## 属性
* Rule_id
* Position_id
* 


- オブジェクト指向設計実践ガイドを読んでいたら惨劇クラスや模擬戦クラスより先に、
盤面情報を『描画』『更新』『算出』『検索』する盤面クラスを先に作るべきかなと思った。<br>
と、言うのも惨劇や模擬戦が各エリアを直隷しているのは、なんと言うかちょっと気持ち悪い。
惨劇や模擬戦モデルの仕事はいまだによく分からないけど、盤面とは切り離せる気がした。
- つまり
1. 盤面モデルは盤面描画に必要な情報のみ抱えて盤面を描画、当座は盤面内の情報の更新も行う
2. 惨劇モデルや模擬戦モデルは盤面へ操作要求を行う
- みたいな感じ。実際のプライベートメソッド公開動詞はこんな感じかな？
1. 『初期化』 盤面を初期化する。完全な更地起点の初期化と脚本情報を前提とした初期化が考えられる。
2. 『描画』文字通り盤面を描画する。部分テンプレートによる描画、controller内部のprotectされた動詞で変数を確保するイメージ。
3. 『算出』盤面内部で定義できる値を取り出す。「キーパーソンに暗躍が２つ以上乗っている」みたいな。ひょっとしたら変数(Var)モデル作るかも。
4. 『検索』盤面内部で条件を満たすカードを取り出す。「暗躍が１つ以上乗っているキャラクター」みたいな。これも変数(Var)モデル行きか？
5. 『更新』盤面内部の情報の更新。「神社に暗躍を２つ乗せる」みたいな。これはMove(指手)モデル作るかも。
- こう考えると描画モデルに必須そうなのは『初期化』『描画』メッセージのみ。他は後で実装しよう。
# 盤面系統のモデル
## Board(ボード)
### 属性
- 色々な関数も必要そうだけど当座はこれで十分
* week
* day
* 
### 隷下
- 盤面はあんまり脚本や惨劇へ直接依存させない(=所属させない)方が良さそう。情報は引数乃至盤面の隷下を検索しちゃう方が盤面は安定する。
- エリア代表キャラは座idで弁別する事にしてみる。外部からは隠蔽されているからこう言う具体的すぎる実装でも問題無いよね。
* Script
* Chara
* 

## Card(カード)
### 属性
* status
* location
* paranoia
* goodwill
* intrigue
* friended
* deaded
* 
* Board_id
* Za_id
* Position_id
* 
### 隷下
* Aura
* 

- まだ実装してないけどstep_ttlが胡散臭い。とりあえずもっと具象寄りなものを実装して共通部分は後で考えよう。当座は行動(Action)かな
## Aura(付与)
### 属性
* name
    - 付与の名前。enumハッシュで済ませちゃうかも。
* value
    - 文字通り値。数値。
* is_counter
    - カウンターか否かを示す。
* step_ttl
    - 付与のステップレベルでの生存時間。1以上だと適当なタイミングで殺される
    1. 処理積立系生存時間、解決時に全ての積立を処理し終えた後で死ぬ。行動カードや能力効果が該当。これはEffect(効果)モデルに移すかも
    2. 誘発系生存時間。友好解決後誘発、死亡時誘発に使う
* day_ttl
* week_ttl
* 

## Area(領域)
### 属性
* name
    - 領域は名前だけを持つ。他言語で便利そうだからenumにしてja.ymlで名前を付ける予定。


# 模擬戦系統のモデル
## Mock(模擬戦)
### 属性
* Script_id
* 
### 隷下
* Board
* Chara
* 

## Board(ボード)
### 属性
* Mock_id
### 隷下
* Chara
* Delegate(ボードの代表となるChara。関連付けはhas_one: delegate, class_name: "Chara")
* 

## Chara(キャラ)
### 属性
* Mock_id
* Board_id
* Pawn_id(模擬戦はPawnと連動していた方が都合が良さそうなので)
* Delegate_id(キャラが代表しているBoard。バリデーションでエラーが起きるからChara側からの関連付けはしない)
* 



# 惨劇系統のモデル
## Tragedy(惨劇)
### 属性
- Script_idはいらない。必要なのはルール構成とカードのデータと事件情報だけだから。
と、思ったけど実惨劇するのかテスト惨劇するのかで形が変わりそう
    - 実惨劇ならば可変な脚本との依存関係は切るべき。ルールなんかも自前で抱えていた方が良い
    - テスト惨劇ならばむしろ脚本に依存していたい。
    積極的にテストを中断して脚本に手戻りして修正できる様でありたい。そうなるとイメージとしては
        1. リセットボタンでテスト盤面をリセットして脚本データによる初期化を受ける
        2. 毎フェーズに強制・任意の操作を請求してくれる
        3. 可能ならば、脚本の能力に依存しない手動操作機能があると良い
- ルール３つへの関連付けを１対多×3で実装してみる。多対多関連付けだと順番でルールの位置を指定するのが結構不便. 
- 特殊ルールは追加ルール的な印象があるのでentraで. 
- 当座、現在の日付と現在の週数はdate属性として惨劇モデルが抱える事にする. 
- 結論、惨劇モデルじゃなくて模擬戦モデルを試しに作ってみる事にする
* name
* noof_days
* noof_weeks
* rule_y_id
* rule_x1_id
* rule_x2_id
* extra
### 所持
* Board
* Chara
*

