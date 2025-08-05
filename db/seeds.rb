# frozen_string_literal: true
Monster.destroy_all
Mystery.destroy_all
puts "🌱 Seeding..."

puts "Creating mysteries..."
Mystery.create(title: "Aclue for Scooby-Doo", location: "Rocky Point Beach", date_reported: 19692009)
Mystery.create(title: "Go Away Ghost Ship", location: "Skull Island", date_reported: 19691309)
Mystery.create(title: "What a Night for a Knight", location: "Musemeum and Castle", date_reported: 19691309)
Mystery.create(title: "Bedlam in the Big Top", location: "A Clown Motel", date_reported: 19691511)
Mystery.create(title: "Jeepers, Its the Creeper", location: "Caustic Caverns", date_reported: 19702609)

puts "Creating monsters..."
Monster.create(name: "Ghost of Captain Cutler", disguise_as: "Captain Cutler", mystery: Mystery.first)
Monster.create(name: "Ghost of Redbeard", disguise_as: "C.L Magnus", mystery: Mystery.second)
Monster.create(name: "Black Knight Ghost", disguise_as: "Mr Wickles", mystery: Mystery.third)
Monster.create(name: "The Ghost Clown", disguise_as: "Harry the Hypnotist", mystery: Mystery.fourth)
Monster.create(name: "The Creeper", disguise_as: "Mr. Carswell", mystery: Mystery.fifth)
puts "✅ Done seeding!"
