# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
   cities = City.create([{ name: 'Ahmedabad' }, { name: 'Surat' },{ name: 'Vadodara' },{ name: 'Rajkot' },{ name: 'Bhavnagar' },{ name: 'Jamnagar' },{ name: 'Morbi' },{ name: 'Modasa' },{ name: 'Vapi' },{ name: 'Valsad' }])

   admin = Admin.create(email: 'admin@admin.com',password: "12345")
