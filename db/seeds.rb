require 'faker'

puts "🤨Clearing db..."
User.all.destroy_all
ItemStatus.all.destroy_all
ItemDetail.all.destroy_all


puts "🤪Making users..."                        
15.times {User.create(username: Faker::FunnyName.name, user_type: Faker::Job.title)}

puts "😊Making item details..." 
15.times {ItemDetail.create(object_name: Faker::BossaNova.song,
                            image_url: Faker::Avatar.image,
                            object_year: 1900,
                            object_type: Faker::Educator.subject,
                            object_description: Faker::Markdown.sandwich(sentences: rand(3..6), repeat: rand(2..5)),
                            condition: "good",
                            location: Faker::Address.city,
                            bought_at:Faker::Company.name
                            )}

puts "🥲Making item statuses..." 
15.times {ItemStatus.create(item_detail_id: ItemDetail.all.sample.id,
                            user_id:User.all.sample.id,
                            selling_or_donating: Faker::Educator.subject,
                            price_for_selling: rand(60..500),
                            is_shipped: Faker::Boolean.boolean,
                            has_invoice: Faker::Boolean.boolean
                            )}

puts "😁YAAAAAAAAAYYYYYYYYYY"


