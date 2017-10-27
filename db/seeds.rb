Pair.destroy_all
User.destroy_all
GeneratedPair.destroy_all

snape = User.create!(email: "snape@codimatch.com", password: "123456", admin: true)
sirius = User.create!(email: "sirius@codimatch.com", password: "123456", admin: true)
minerva = User.create!(email: "minerva@codimatch.com", password: "123456", admin: true)
hagrid = User.create!(email: "hagrid@codimatch.com", password: "123456", admin: true)
dumbledore = User.create!(email: "dumbledore@codimatch.com", password: "123456", admin: true)
harrypotter = User.create!(email: "harrypotter@codimatch.com", password: "123456")
hermione = User.create!(email: "hermione@codimatch.com", password: "123456")
ron = User.create!(email: "ron@codimatch.com", password: "123456")
fred = User.create!(email: "fred@codimatch.com", password: "123456")
george = User.create!(email: "george@codimatch.com", password: "123456")
draco = User.create!(email: "draco@codimatch.com", password: "123456")
voldemort = User.create!(email: "voldemort@codimatch.com", password: "123456")
neville = User.create!(email: "neville@codimatch.com", password: "123456")
dobby = User.create!(email: "dobby@codimatch.com", password: "123456")
luna = User.create!(email: "luna@codimatch.com", password: "123456")
