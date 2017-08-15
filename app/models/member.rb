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
  attribute :admin_flag, :boolean, default: false
  attr_accessor :password, :password_confirmation, :old_password

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
end
