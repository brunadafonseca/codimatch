User.destroy_all

user1 = User.create!(email: "teacher1@codimatch.com", password: "123abc", admin: true)
user2 = User.create!(email: "teacher2@codimatch.com", password: "123abc", admin: true)
user3 = User.create!(email: "teacher3@codimatch.com", password: "123abc", admin: true)
user4 = User.create!(email: "student1@codimatch.com", password: "1234ab")
user5 = User.create!(email: "student2@codimatch.com", password: "1234ab")
user6 = User.create!(email: "student3@codimatch.com", password: "1234ab")
user7 = User.create!(email: "student4@codimatch.com", password: "1234ab")
