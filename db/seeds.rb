require 'faker'

puts "🤨 Clearing db..."
User.all.destroy_all
ItemStatus.all.destroy_all
Item.all.destroy_all


puts "🤪 Making users..."                        
user1 = User.create!(id: Faker::IDNumber.valid, username: "yixin", user_type: "Family", email: "sam19931225@gmail.com", password: "12345")
user2 = User.create!(id: Faker::IDNumber.valid, username: "samgong1", user_type: "Individual", email: "sam19931227@gmail.com", password: "12345")
user3 = User.create!(id: Faker::IDNumber.valid, username: "samgong2", user_type: "Family", email: "sam19931226@gmail.com", password: "12345")
user4 = User.create!(id: Faker::IDNumber.valid, username: "samgong3", user_type: "Individual", email: "sam19931222@gmail.com", password: "12345")


puts "😊 Making item details..." 
item1 = Item.create!(id: Faker::IDNumber.valid,object_name: "Radio", user_id: user1.id, image_url: "https://m.media-amazon.com/images/I/91TSzAoi80L._AC_SY355_.jpg", object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)
item2 = Item.create!(id: Faker::IDNumber.valid,object_name: "Bag", user_id: user1.id, image_url: "https://www.bhphotovideo.com/images/images1500x1500/manhattan_portage_1505_blk_aperture_camera_bag_black_1549039.jpg", object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)
item3 = Item.create!(id: Faker::IDNumber.valid,object_name: "T-shirt", user_id: user1.id, image_url: "https://img.sonofatailor.com/images/customizer/product/White_O_Crew_Regular_NoPocket.jpg", object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)
item4 = Item.create!(id: Faker::IDNumber.valid,object_name: "Notebooks", user_id: user1.id, image_url: "https://i5.walmartimages.com/asr/dd17a6d5-ee3e-414d-9457-8321a1f1999c.f35bfc62d5de8a7d5607fcbc988db9a8.jpeg", object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)
item5 = Item.create!(id: Faker::IDNumber.valid,object_name: "123212", user_id: user2.id, image_url: Faker::Avatar.image, object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)
item6 = Item.create!(id: Faker::IDNumber.valid,object_name: "12321213", user_id: user2.id, image_url: Faker::Avatar.image, object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)
item7 = Item.create!(id: Faker::IDNumber.valid,object_name: "12331312", user_id: user2.id, image_url: Faker::Avatar.image, object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)
item8 = Item.create!(id: Faker::IDNumber.valid,object_name: "1233131", user_id: user2.id, image_url: Faker::Avatar.image, object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)
item9 = Item.create!(id: Faker::IDNumber.valid,object_name: "1232112", user_id: user3.id, image_url: Faker::Avatar.image, object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)
item10 = Item.create!(id: Faker::IDNumber.valid,object_name: "123211213", user_id: user3.id, image_url: Faker::Avatar.image, object_year: 1900,object_type: "love",object_description: Faker::Lorem.paragraphs(number: 1),condition: "good",location: Faker::Address.city,bought_at:Faker::Company.name, has_invoice: false)

                        

puts "🥲 Making item statuses..." 
ItemStatus.create!(item_id: item3.id, user_id: 1, selling_or_donating: false, report_date: "2020-02-02",is_shipped: false)
ItemStatus.create!(item_id: item3.id, user_id: 1, selling_or_donating: true, report_date: "2020-02-02",is_shipped: true)
ItemStatus.create!(item_id: item3.id, user_id: 1, selling_or_donating: false, report_date: "2020-02-02",is_shipped: false)
ItemStatus.create!(item_id: item3.id, user_id: 1, selling_or_donating: true, report_date: "2020-02-02",is_shipped: true)

puts "😁 YAAAAAAAAAYYYYYYYYYY"


