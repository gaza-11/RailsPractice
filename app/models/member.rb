# 会員情報クラス
#   DB上のデータ
#     id
#     name
#     admin_flag
#     hashed_password
#   DB登録しないデータ
#     password
#     password_confirmation
#     old_password
class Member < ApplicationRecord
  validates :name, presence: true
  validates :password, presence: { on: :create },  confirmation: true
  attr_accessor :password, :password_confirmation, :old_password
  before_save :set_admin_flag

  def password=(val)
    self.hashed_password = BCrypt::Password.create(val) if val.present?
    @password = val
  end

  class << self
    def authenticate(name, password)
      member = find_by name: name
      if member &&
         member.hashed_password.present? &&
         BCrypt::Password.new(member.hashed_password) == password
        member
      else
        nil
      end
    end
  end

  private

  # Memberモデルを通して保存する場合は必ずAdminFlagはFalse(TrueにするユーザはDBのコンソールで)
  def set_admin_flag
    self.admin_flag = false
  end
end
