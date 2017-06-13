class Actor < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 1, maximum: 20 }
  validates :last_name, presence: true, length: { minimum: 1, maximum: 20 }
  validate :birthday_valid?

  class << self
    def filter_by_name(first_name, last_name)
      if first_name.present? && last_name.present?
        actors = where 'first_name like ? and last_name like ?', "%#{first_name}", "%#{last_name}"
      elsif first_name.present?
        actors = where 'first_name like ?', "%#{first_name}"
      elsif last_name.present?
        actors = where 'last_name  like ?', "%#{last_name}"
      else
        actors = all
      end

      actors
    end
  end

  def birthday_valid?
    date = birthday_before_type_cast
    return if date.blank?

    (y, m, d) = date.split('/').map &:to_i
    (y, m, d) = [y, m, d].map { |value| value.nil? ? 0 : value }
    errors[:birthday] = I18n.t('errors.messages.invalid_date') unless Date.valid_date?(y, m, d)
  end
end
