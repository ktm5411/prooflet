PartyFoul.configure do |config|
  # The collection of exceptions PartyFoul should not be allowed to handle
  # The constants here *must* be represented as strings
  config.blacklisted_exceptions = ['ActiveRecord::RecordNotFound', 'ActionController::RoutingError']

  # The OAuth token for the account that is opening the issues on Github
  config.oauth_token            = '9455046eab664a8af90c19b1a9d5ce9c5a09b1c3'

  # The Web URL for Github. Unless you are hosting a private
  # instance of Enterprise Github you do not need to include this
  config.web_url                = 'https://github.com'

  # The organization or user that owns the target repository
  config.owner                  = 'ktm5411'

  # The repository for this application
  config.repo                   = 'prooflet'

  # The branch for your deployed code
  # config.branch               = 'master'

  # Additional labels to add to issues created
  # config.additional_labels    = ['production']
  config.additional_labels = Proc.new do |exception, env|
    labels = []
    labels << (env["RACK_ENV"] || env["RAILS_ENV"]) if env["RACK_ENV"] || env["RAILS_ENV"]
    labels << 'database' if exception.message =~ /PG::Error/
    labels
  end
end
