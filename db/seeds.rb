# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[ ["dwarf-laugh", "Dwarf Laugh"], 
  ["net", "Net"], 
  ["spear", "Spear"], 
  ["water-blast", "Water Blast"],  
  ["voice-shush", "Voice Shush"] ].each do |shout|

    Shout.create(filename: shout[0], shout_msg: shout[1])
end
