# モデル
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

## Za(キャラクターの座)
### 属性
* name
* paranoia_limit
* 
### 隷下
* Ability
* Za_Category_Attribution
* Chara
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




##  Script(脚本)
### 属性
* name
* noof_days
* noof_weeks
* 
### 所持
* Tragedy
* Incident
* Script_Rule_Contract
* 
### 隷下
* Summary
* 

## Rule(ルール)
### 属性
* 