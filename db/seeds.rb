# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#puts 'CREATING ROLES'
#[
#  { :name => 'admin' },
#  { :name => 'advertisement' },
#  { :name => 'user' },
#].each do |h|
#  Role.create!(h) unless Role.where(:name => h[:name]).exists?
#end

puts 'SETTING UP DEFAULT USER LOGIN'

#[
#  [:admin,         {:email => 'admin@example.com'}],
#  [:advertisement, {:email => 'ads.com'}],
#  [:user,          {:email => 'user3@example.com'}]
#].each do |(role, h)|
#  next if User.where(:email => h[:email]).exists?
#
#  user = User.create!({:password => '12345678', :password_confirmation => '12345678'}.merge(h))
#  user.add_role(role)
#  p "added user: #{user.email}"
#end
[
#  [Admin,   {:email => 'admin@example.com'}],
  [Auditor,    {:email => 'auditor@mail.com'}],
  [Advertiser, {:email => 'adv@mail.com'}]
].each do |(klass, h)|
  next if klass.where(:email => h[:email]).exists?

  user = klass.create!({:password => '12345678', :password_confirmation => '12345678'}.merge(h))
  p "added user: #{user.email}"
end

