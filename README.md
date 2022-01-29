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



# その他未整理のモデル
## Tragedy(惨劇)
### 属性
* name
*
* Script_id
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





