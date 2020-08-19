# job-offer DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_img|string||
<!-- 企業名 -->
|company_name|string|null: false|
|company_name_kana|string|null: false|
<!-- 事業内容 -->
|business_content|string|null: false|
<!-- 担当者名 -->
|staff_name|string|
|staff_name_kana|string|
|URL|string||
<!-- FAX番号 -->
|faxphone|integer||
|phone|integer|null: false|
|email|string|null: false|
|password|string|null: false|


### Association
- has_many :comments, dependent: :destroy
- has_many :jobs, dependent: :destroy
- has_one :address, dependent: :destroy
- has_many :started_jobs, foreign_key: "start_id", class_name: "Job"
- has_many :stoped_jobs, -> { where("stop_id is NULL") }, foreign_key: "stop_id", class_name: "Job"
- has_many :ending_jobs, -> { where("end_id is not NULL") }, foreign_key: "end_id", class_name: "Job"


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|company_name_deliver|string|null: false|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|user_id|integer|null: false, foreign_key: true|

### Association
- belong_to :user


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|content|text||
|job_id|integer|null: false, foreign_key: true|

### Association
- belong_to :user
- belong_to :job


## jobsテーブル

|Column|Type|Options|
|------|----|-------|
<!-- 職種 -->
|occupation|string|null: false|
<!-- 掲載開始日 -->
|Posting_start_date|integer|null: false|
<!-- 掲載終了日 -->
|Posting_end_date|integer|null: false|
<!-- 雇用形態 -->
|employment_status_id|string|null: false|
<!-- 仕事内容 -->
|job_description|text|null: false|
<!-- 応募資格 -->
|qualification|text|null: false|
<!-- 給与 -->
|salary|text|null: false|
<!-- 待遇、福利厚生 -->
|treatment|text|null: false|
<!-- 勤務時間 -->
|working_hours|text|null: false|
<!-- 休日 -->
|holiday|text|null: false|
<!-- 勤務地 -->
|work_location|integer|null: false|
<!-- 応募方法 -->
|application_method|integer|null: false|
<!-- お問い合わせ先 -->
|contact|integer|null: false|
<!-- 所在地 -->
|location|integer|null: false|
|phone|integer|null: false|
<!-- 担当者名 -->
|contact_name|string|null: false|
|hp_address|string|
|start_id|integer|null: false|
|stop_id|integer|
|end_id_id|integer|

### Association
has_many :comments, dependent: :destroy
belong_to :user
belong_to :category
has_many :images, dependent: :destroy
accepts_nested_attributes_for :images, allow_destroy: true
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to_active_hash :employment_status
belongs_to :start, class_name: "User", optional: true
belongs_to :stop, class_name: "User", optional: true
belongs_to :end, class_name: "User", optional: true



## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|str|string||
|job_id|integer|null: false, foreign_key: true|

### Association
mount_uploader :src, ImageUploader
belongs_to :product


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|integer|index: true|

### Association
has_many :jobs
has_ancestry
