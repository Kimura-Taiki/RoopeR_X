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



<!--眠い、-->
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

## Board(ボード)
### 属性
* build
*
* Tragedy_id
### 所持
* Chara
*

## Chara(キャラ)
### 属性
*
* Tragedy_id
* Board_id
* Za_id
*





