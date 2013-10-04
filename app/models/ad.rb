class Ad < ActiveRecord::Base
  TYPES = {:wednesday => 1, :sunday => 2}

  validates :ad_type, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 1}
  validates :address, :city, :presence => true
  validates :bull1, :bull2, :bull3, :presence => true, :length => {:maximum => 22}
  validates :agent, :agent_phone, :presence => true
  validates :when_run, :presence => true # TODO validate date?

  with_options :if => :wednesday? do |w|
    w.validates :bull4, :sms_code, :presence => true
  end

  with_options :if => :sunday? do |w|
    w.validates :mls, :agent_email, :presence => true
  end

  def wednesday?
    ad_type == TYPES[:wednesday]
  end

  def sunday?
    ad_type == TYPES[:sunday]
  end

  def when_run=(obj)
    write_attribute :when_run, obj.is_a?(String) ? Date.strptime(obj, '%m/%d/%Y') : obj
  end

  def named_ad_type
    if wednesday?
      'wednesday'
    elsif sunday?
      'sunday'
    else
      nil
    end
  end
end
