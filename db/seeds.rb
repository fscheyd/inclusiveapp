Review.destroy_all
User.destroy_all
Business.destroy_all

User.create([
    {username:"businessman", email:"man@business.com", password:"1234"}, 
    {username:"businessesman", email:"business@man.com", password:"4321"},
    {username: "melon_lord", email: "toph@bestearthbender.com", password: "lastnameever"}
    ])

Business.create([
    {business_name:"AMC Theaters", business_type:"Movie Theater", business_address:"123 park st.", business_phone_number:"555-555-5555"}
    {business_name:"O'Jungs", business_type:"Gastropub", business_address:"1625 S 2nd St, Phila", business_phone_number:"215-468-9697"}
])