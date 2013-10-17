require 'carrierwave/storage/ftp'

CarrierWave.configure do |config|
  config.ftp_host = 'ftp.windfallstudio.com'
  config.ftp_port = 21
  config.ftp_user = 'prooflet@windfallstudio.com'
  config.ftp_passwd = 'Abcd3fg*'
  config.ftp_folder = '/prooflet_uploads'
  config.ftp_url = "ftp://windfallstudio.com#{config.ftp_folder}_#{Rails.env.to_s}"
  config.ftp_passive = false # false by default
end