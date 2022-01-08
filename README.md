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

## Pawn(駒)
### 属性
* 
* Script_id
* Za_id
* Role_id
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

## Crime(犯罪の構成要件)
### 隷下
* Package_Crime_Own
* 

## Package_Crime_Own(セット犯罪間交差テーブル) 
### 属性
* Package_id
* Cr

## Package(惨劇セット)
### 属性
* 
### 隷下
* Package_Crime_Own
* Script
* 

## Rule(ルール)
### 属性
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





