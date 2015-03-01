namespace :fake_shusher do

  desc "populate users"
  task :populate_users, [:arg1] => :environment do |t, args|
    base = User.last.email.split("@")[0][-1].to_i  #grab the last n in user email
    puts args
    puts args[:arg1]
    # generate arg1 user
    args[:arg1].to_i.times do |n|
      User.create(email: "sample#{n+2+base}@email.com",
                  #password_digest: "codecore", #Faker::Lorem.sentence(2),
                  first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name, 
                  ip_address: Faker::Internet.ip_v4_address,
 )
    end     
  end

  desc "generate fake shusher objects"
  task :make_shushers, [:arg2] => :environment do |t, args|
    base = Shusher.last.name[-1].to_i #grab the last n in shusher name
    puts base
    args[:arg2].to_i.times do |n|
      Shusher.create!(name: "s#{n+1+base}",
                     sound_threshold: 5,
                     shout_msg: "Hush #{n+1+base} everyone!",
                     mac_address: Faker::Internet.mac_address,
                     ip_address: Faker::Internet.ip_v4_address,
                     user: User.all.sample )
    end
  end
end

#bin/rake fake_shusher:make_shushers      to run this rake task.