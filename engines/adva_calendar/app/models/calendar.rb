class Calendar < Section
  has_many :events, :foreign_key => 'section_id', :class_name => 'CalendarEvent'
    
  class << self
    def content_type
      'CalendarEvent'
    end
  end
  def days_in_month_with_events(date)
    events.find(:all, 
        :select => 'start_date', :order => 'start_date ASC',
        :conditions => ['start_date > ? and start_date < ?', date.beginning_of_month, date.end_of_month]).collect{|e| e.start_date.to_date}
  end
end
