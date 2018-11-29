## opdt_Yamanotesテーブル

|Column|Type|Options|
|------|----|-------|
|**o_id|string|このデータのid|
|o_type|string|交通手段|
|**date|datetime|計測開始時間|
|context|string|JSON-LD仕様に基づく @context のURL|
|o_valid|datetime|計測終了時間（５分ごとにデータ取得）|
|**delay|integer|遅れ（秒）|
|odpt_index|integer| 駅の順序を表すリスト|
|same_as|string|データに付与された固有識別子の別名|
|railway|string|路線名|
|operator|string|運行会社|
|to_station|string|次駅|
|train_type|string|列車種別|
|**from_Station|string| 前駅|
|train_number|string|列車種別|
|**direction|string|内・外回り|
|Composition|integer| 編成|
|destination_station|string|終着駅|


## opdt_Jobansテーブル

|Column|Type|Options|
|------|----|-------|
|**o_id|string|このデータのid|
|o_type|string|交通手段|
|**date|datetime|計測開始時間|
|context|string|JSON-LD仕様に基づく @context のURL|
|o_valid|datetime|計測終了時間（５分ごとにデータ取得）|
|**delay|integer|遅れ（秒）|
|odpt_index|integer| 駅の順序を表すリスト|
|same_as|string|データに付与された固有識別子の別名|
|railway|string|路線名|
|operator|string|運行会社|
|to_station|string|次駅|
|train_type|string|列車種別|
|**from_Station|string| 前駅|
|train_number|string|列車種別|
|**direction|string|上下|
|Composition|integer| 編成|
|destination_station|string|終着駅|

## station_name_yamatesテーブル

|Column|Type|Options|
|------|----|-------|
|@id|string|このデータのid|
|station_name|string|null: false|

## station_name_jyobansテーブル

|Column|Type|Options|
|------|----|-------|
|@id|string|このデータのid|
|station_name|string|null: false|

## calculation_result_yamatesテーブル

|Column|Type|Options|
|------|----|-------|
|@id|string|このデータのid|
|target|integer|駅間|
|delay_ave|integer|遅れ平均|
|month|integer||
|week|integer|
|day|integer|
|hour|integer|

## calculation_result_jyobansテーブル

|Column|Type|Options|
|------|----|-------|
|@id|string|このデータのid|
|target|integer|駅間|
|delay_ave|integer|遅れ平均|
|month|integer||
|week|integer|
|day|integer|
|hour|integer|

### Association

