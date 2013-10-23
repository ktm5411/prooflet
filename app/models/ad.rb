class Ad < ActiveRecord::Base
  TYPES = {:wednesday => 1, :classified => 2, :sunday => 3}

  validates :ad_type, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 1}
  validates :address, :city, :presence => true
  validates :bull1, :bull2, :bull3, :presence => true, :length => {:maximum => 22}
  validates :agent, :agent_phone, :presence => true
  validates :when_run, :image, :presence => true # TODO validate date?

  with_options :if => :wednesday? do |w|
    w.validates :bull4, :sms_code, :presence => true
  end

  with_options :if => :classified? do |w|
    w.validates :mls, :agent_email, :presence => true
  end

  mount_uploader :image, AdUploader

  TYPES.each do |m, v|
    define_method "#{m}?" do
      ad_type == TYPES[m]
    end
  end

  def humanized_type
    TYPES.index(ad_type).to_s.humanize
  end

  def when_run=(obj)
    return if obj.blank?
    write_attribute :when_run, obj.is_a?(String) ? Date.strptime(obj, '%m/%d/%Y') : obj
  end

  def named_ad_type
    if wednesday?
      'wednesday'
    elsif sunday?
      'sunday'
    elsif classified?
      'classified'
    else
      nil
    end
  end
end
