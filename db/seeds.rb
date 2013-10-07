# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'SETTING UP DEFAULT USER LOGIN'

[
  [Auditor,    {:email => 'auditor@mail.com'}],
  [Advertiser, {:email => 'adv@mail.com'}]
].each do |(klass, h)|
  next if klass.where(:email => h[:email]).exists?

  user = klass.create!({:password => '12345678', :password_confirmation => '12345678'}.merge(h))
  p "added user: #{user.email}"
end

