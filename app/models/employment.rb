class Employment < ActiveHash::Base
  self.data = [
    {id: 0, name: '選択してください'},
    {id: 1, name: '正社員'}, {id: 2, name: '契約社員'}, {id: 3, name: '派遣社員'},
    {id: 4, name: 'パート/アルバイト'}, {id: 5, name: '業務委託'}, {id: 6, name: '業務請負'}, {id: 7, name: '登録'}, {id: 8, name: '期間従業員'}, {id: 9, name: '紹介予定派遣'}, {id: 10, name: '準社員'}, {id: 11, name: '嘱託'}, {id: 12, name: '開業'}, {id: 13, name: '在宅/内職'}
  ]
  include ActiveHash::Associations
  has_many :jobs
end
