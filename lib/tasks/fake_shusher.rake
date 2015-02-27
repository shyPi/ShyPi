namespace :fake_shusher do

  desc "generate 3 fake shusher objects"
  task :make_3 => :environment do
    3.times do |n|
      Shusher.create(name: "s#{n+1}", sound_threshold: n+1, shout_msg: "Hush #{n+1} everyone!")
    end
  end
end

#bin/rake fake_shusher:make_shushers      to run this rake task.