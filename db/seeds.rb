require 'faker'

puts "🤨 Clearing db..."
User.all.destroy_all
ItemStatus.all.destroy_all
ItemDetail.all.destroy_all


puts "🤪 Making users..."                        
15.times do User.create(username: Faker::Name.first_name, user_type: Faker::Job.title, name: Faker::FunnyName.name, password: Faker::Internet.password)
end

puts "😊 Making item details..." 
15.times do ItemDetail.create(object_name: Faker::BossaNova.song,
                            image_url: Faker::Avatar.image,
                            object_year: 1900,
                            object_type: Faker::Educator.subject,
                            object_description: Faker::Lorem.paragraphs(number: 1),
                            condition: "good",
                            location: Faker::Address.city,
                            bought_at:Faker::Company.name,
                            )

                        end

puts "🥲 Making item statuses..." 
15.times do ItemStatus.create!(item_detail_id: ItemDetail.all.sample.id,
                            user_id:User.all.sample.id,
                            selling_or_donating: Faker::Educator.subject,
                            price_for_selling: rand(60..500),
                            is_shipped: Faker::Boolean.boolean,
                            has_invoice: Faker::Boolean.boolean
                            )
                        end

puts "😁 YAAAAAAAAAYYYYYYYYYY"


