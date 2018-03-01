class Announcement < ActiveRecord::Base
  def self.current(hidden_ids = nil)
    result = all
    result = where("deleted = false AND starts_at <= :now and ends_at >= :now", now: Time.zone.now)
    result = result.where("id not in (?)", hidden_ids) if hidden_ids.present?
    result
  end

  def display_start_time(format = :us_time)
    starts_at ? I18n.localize(starts_at, :format => format) : 'N/A'
  end

  def display_end_time(format = :us_time)
    ends_at ? I18n.localize(ends_at, :format => format) : 'N/A'
  end
end
