require 'faker'

puts "🤨 Clearing db..."
User.all.destroy_all
ItemStatus.all.destroy_all
Item.all.destroy_all


puts "🤪 Making users..."                        
user1 = User.create!(id: 1, username: "samgong", user_type: "Family", email: "sam19931225@gmail.com", password: "12345")
user2 = User.create!(id: 2, username: "samgong1", user_type: "Individual", email: "sam19931227@gmail.com", password: "12345")
user3 = User.create!(id: 3, username: "samgong2", user_type: "Family", email: "sam19931226@gmail.com", password: "12345")
user4 = User.create!(id: 4, username: "samgong3", user_type: "Individual", email: "sam19931222@gmail.com", password: "12345")


puts "😊 Making item details..." 
item1 = Item.create!(id: 1,object_name: "Radio", user_id: 1, image_url: Faker::Avatar.image, object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)
item2 = Item.create!(id: 2,object_name: "Bag", user_id: 1, image_url: Faker::Avatar.image, object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)
item3 = Item.create!(id: 3,object_name: "T-shirt", user_id: 1, image_url: Faker::Avatar.image, object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)
item4 = Item.create!(id: 4,object_name: "12344", user_id: 1, image_url: Faker::Avatar.image, object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)
item5 = Item.create!(id: 5,object_name: "123212", user_id: 2, image_url: Faker::Avatar.image, object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)
item6 = Item.create!(id: 6,object_name: "12321213", user_id: 2, image_url: Faker::Avatar.image, object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)
item7 = Item.create!(id: 7,object_name: "12331312", user_id: 2, image_url: Faker::Avatar.image, object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)
item8 = Item.create!(id: 8,object_name: "1233131", user_id: 2, image_url: Faker::Avatar.image, object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)
item9 = Item.create!(id: 9,object_name: "1232112", user_id: 3, image_url: Faker::Avatar.image, object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)
item10 = Item.create!(id: 10,object_name: "123211213", user_id: 3, image_url: Faker::Avatar.image, object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)

                        

puts "🥲 Making item statuses..." 
ItemStatus.create!(item_id: 1, user_id: 1, selling_or_donating:Faker::Boolean.boolean, report_date: "2020-02-02",is_shipped: Faker::Boolean.boolean)
ItemStatus.create!(item_id: 3, user_id: 1, selling_or_donating:Faker::Boolean.boolean, report_date: "2020-02-02",is_shipped: Faker::Boolean.boolean)
ItemStatus.create!(item_id: 2, user_id: 1, selling_or_donating:Faker::Boolean.boolean, report_date: "2020-02-02",is_shipped: Faker::Boolean.boolean)
ItemStatus.create!(item_id: 4, user_id: 1, selling_or_donating: Faker::Boolean.boolean, report_date: "2020-02-02",is_shipped: Faker::Boolean.boolean)

puts "😁 YAAAAAAAAAYYYYYYYYYY"


