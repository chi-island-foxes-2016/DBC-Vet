# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "Pandora", password: "password")
Group.create(group_type: "veterinarian")
Group.create(group_type: "technician")
Group.create(group_type: "front desk")
Group.create(group_type: "admin")


Document.create(content:"Just as your physician will check your vital signs, weight, and other conditions when you visit the doctor, your veterinarian will also want to check vital signs and obtain basic medical information about your pet. In addition to checking your pet's weight, looking at your pet's eyes, checking its ears, routine examination of the mouth and teeth, and observing the pet's movements, there are other simple tests that are often performed.", group_id: 1)
Document.create(content:"Besides working in private clinics and animal hospitals, veterinary technologists and
technicians may work in research facilities, where they may administer medications orally or
topically, prepare samples for laboratory examinations.", group_id: 2)
Document.create(content:"Respond to calls and be kind. Also take notes of patients and schedule appoitments", group_id: 3)
Document.create(content: "Keeps track of the employeers, and documents", group_id: 4)