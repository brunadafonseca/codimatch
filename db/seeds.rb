User.destroy_all

user1 = User.create!(email: "teacher@codimatch.com", password: "123abc", admin: true)
user2 = User.create!(email: "student@codimatch.com", password: "1234ab")
