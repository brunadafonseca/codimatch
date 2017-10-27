Pair.destroy_all
User.destroy_all
GeneratedPair.destroy_all

user1 = User.create!(email: "teacherAAAA@codimatch.com", password: "123456", admin: true)
user2 = User.create!(email: "something@codimatch.com", password: "123456", admin: true)
user3 = User.create!(email: "shit@codimatch.com", password: "123456", admin: true)
user4 = User.create!(email: "ernst@codimatch.com", password: "123456")
user5 = User.create!(email: "bruna@codimatch.com", password: "123456")
user6 = User.create!(email: "friso@codimatch.com", password: "123456")
user7 = User.create!(email: "frank@codimatch.com", password: "123456")
user8 = User.create!(email: "floris@codimatch.com", password: "123456")
user9 = User.create!(email: "lara@codimatch.com", password: "123456")
user10 = User.create!(email: "mike@codimatch.com", password: "123456")
user11 = User.create!(email: "arno@codimatch.com", password: "123456")
