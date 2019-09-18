class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(param)
    param.strip!
    to_send_back = (name_matches(param)).uniq
    # return nil if to_send_back is nil
    return nil unless to_send_back
    to_send_back
  end

  def self.name_matches(param)
    matches('name', param)
  end

  def self.matches(field_name, param)
    where('name like ?', "%#{param}%")
  end



end
