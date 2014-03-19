# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


[
  {title: "I Should Buy a Startup",
  image: "http://timenewsfeed.files.wordpress.com/2012/06/72150783.jpg?w=480&h=320&crop=1",
  body: "Wolf Tumblr Intelligentsia, Brooklyn lomo vegan swag Shoreditch leggings. Bicycle rights Truffaut messenger bag direct trade Bushwick, brunch pop-up fixie organic kale chips Godard drinking vinegar Pinterest master cleanse keytar. Scenester Williamsburg authentic stumptown. Vegan lomo Wes Anderson retro, next level ethical mustache 3 wolf moon YOLO. Chia typewriter actually flexitarian, cred quinoa disrupt seitan skateboard Blue Bottle Helvetica Neutra Wes Anderson hashtag. Schlitz before they sold out swag tousled fixie freegan biodiesel +1 ethical. Terry Richardson Pinterest bitters before they sold out, Vice cred Austin actually jean shorts sartorial PBR pickled chia.",
  author_id: 1}, 
  
  {title: "Obama Does Something, Someone Gets Mad",
  image: "http://i.huffpost.com/gen/267163/thumbs/r-OBAMA-COOL-PHONES-large570.jpg",
  body: "Vegan Neutra whatever Marfa, farm-to-table iPhone vinyl post-ironic kale chips meh. Artisan cornhole gluten-free twee, YOLO deep v Tonx narwhal Austin Schlitz. Fingerstache stumptown twee, Wes Anderson try-hard wayfarers Neutra Brooklyn Carles meh. Gluten-free PBR&B drinking vinegar food truck flexitarian, Tumblr brunch Godard distillery blog. Austin YOLO readymade slow-carb small batch Terry Richardson. Pop-up distillery farm-to-table Blue Bottle, kogi swag authentic quinoa locavore Portland plaid before they sold out VHS Godard. McSweeney's flannel Intelligentsia cardigan fixie distillery, Odd Future Williamsburg.",
  author_id: 1},
  
  {title: "Hey, Cosmos is Back",
  image: "http://media.npr.org/assets/img/2014/02/27/neil_planets12b_dj1_wide-be08419127c6a21519ceeff8ebe87fbc53af1e2c.jpg?s=6",
  body: "Messenger bag keffiyeh ethical, hoodie typewriter 90's forage aesthetic Carles jean shorts blog church-key. Disrupt umami chia, vegan tattooed bespoke ethical DIY Williamsburg fap slow-carb. Godard organic VHS retro. Tattooed swag viral, gluten-free try-hard jean shorts pour-over drinking vinegar art party brunch Terry Richardson pop-up dreamcatcher. Occupy salvia semiotics, Etsy ethical McSweeney's artisan beard banh mi Pitchfork. Skateboard Thundercats squid, stumptown Tonx master cleanse cornhole ethnic tousled. Synth wayfarers PBR&B Echo Park, ennui vegan plaid slow-carb occupy Wes Anderson.",
  author_id: 1},
  
  {title: "I Don't Know Who These People Are",
  image: "http://www.thefablife.com/files/2013/02/OscarsNickiMinajKardashians.jpg", 
  body: "DIY mixtape banjo Intelligentsia pug bicycle rights. XOXO kitsch American Apparel, quinoa Tonx Helvetica tofu occupy. Disrupt Schlitz banh mi ethical, Godard Cosby sweater biodiesel XOXO gastropub wolf 8-bit umami mustache you probably haven't heard of them Marfa. Pug try-hard cornhole, iPhone bespoke authentic ethical messenger bag mustache. Craft beer pickled mlkshk, banjo quinoa Helvetica gentrify church-key pork belly chia food truck literally. Fap before they sold out retro, authentic letterpress cliche squid mumblecore single-origin coffee distillery. Banh mi cray slow-carb, sriracha salvia meggings master cleanse irony XOXO artisan iPhone plaid whatever.",
  author_id: 1}
].each do |entry|
  Article.create!(entry)
end

User.create!({
  username: "Staff Writer",
  password: "password"
})