class Actor < ApplicationRecord
  validates :first_name, presence: true, length: {minimum: 1, maximum: 10}
  validates :last_name, presence: true, length: {minimum: 1, maximum: 10}

  class << self
    def search(first_name, last_name)
      if first_name.present? && last_name.present?
        @actors = where('first_name like ?', "%#{first_name}%").where('last_name like ?', "%#{last_name}%")
      elsif first_name.present?
        @actors = where 'first_name like ?', "%#{first_name}%"
      elsif last_name.present?
        @actors = where 'last_name  like ?', "%#{last_name}%"
      else
        @actors = all
      end

      @actors
    end
  end
end
