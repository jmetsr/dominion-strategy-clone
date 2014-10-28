# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: "Miss Piggy", session_token: "2hVVud1oWa-vMnc0oIc7ZA",
password_digest: BCrypt::Password.create("Miss Piggy"), admin: true)
Topic.create(title: "News and Announcements", admin_in: 5)
Topic.create(title: "Feedback", admin_in: 5)
Topic.create(title: "Rules Questions", admin_in: 5)
Topic.create(title: "Dominion FAQ", admin_in: 5)
