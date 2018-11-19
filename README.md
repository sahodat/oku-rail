## Yamanoteテーブル

|Column|Type|Options|
|------|----|-------|
|**@id|string|このデータのid|
|@type|string|交通手段|
|**dc:date|integer|計測開始時間|
|@context|string|JSON-LD仕様に基づく @context のURL|
|dct:valid|integer|計測終了時間（５分ごとにデータ取得）|
|**odpt:delay|integer|遅れ（秒）|
|odpt:index|integer| 駅の順序を表すリスト|
|owl:sameAs|string|データに付与された固有識別子の別名|
|odpt:railway|string|路線名|
|odpt:operator|string|運行会社|
|odpt:toStation|string|次駅|
|odpt:trainType|string|列車種別|
|**odpt:fromStation|string| 前駅|
|odpt:trainNumber|string|列車種別|
|**odpt:railDirection|string|上下•うち外回り|
|odpt:carComposition|integer| 編成|
|odpt:destinationStation|string|終着駅|


## Jobanテーブル

|Column|Type|Options|
|------|----|-------|
|**@id|string|このデータのid|
|@type|string|交通手段|
|**dc:date|integer|計測開始時間|
|@context|string|JSON-LD仕様に基づく @context のURL|
|dct:valid|integer|計測終了時間（５分ごとにデータ取得）|
|**odpt:delay|integer|遅れ（秒）|
|odpt:index|integer| 駅の順序を表すリスト|
|owl:sameAs|string|データに付与された固有識別子の別名|
|odpt:railway|string|路線名|
|odpt:operator|string|運行会社|
|odpt:toStation|string|次駅|
|odpt:trainType|string|列車種別|
|**odpt:fromStation|string| 前駅|
|odpt:trainNumber|string|列車種別|
|**odpt:railDirection|string|上下•うち外回り|
|odpt:carComposition|integer| 編成|
|odpt:destinationStation|string|終着駅|



### Association
