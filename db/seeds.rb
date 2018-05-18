# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
    {name: "Kristen Leach", email:"kristen@email.com", password: "password", image: Rails.root.join("app/assets/images/kristen.jpg").open},
    {name: "Jessica Jones", email:"jones@email.com", password: "password", image: Rails.root.join("app/assets/images/jessica.jpg").open},
    {name: "Walter White", email:"walt@email.com", password: "password", image: Rails.root.join("app/assets/images/walter.jpg").open},
    {name: "Ben Solo", email:"kyloren@email.com", password: "password", image: Rails.root.join("app/assets/images/kylo.jpg").open},
    {name: "Takeshi Kovacs", email:"tak@email.com", password: "password", image: Rails.root.join("app/assets/images/takeshi.jpg").open},
    {name: "Leeloo Dallas", email:"leeloo@email.com", password: "password", image: Rails.root.join("app/assets/images/leeloo.jpg").open},
    {name: "Rick Deckard", email:"iloverachel@email.com", password: "password", image: Rails.root.join("app/assets/images/deckard.jpg").open},
    {name: "Ziggy Stardust", email:"bowie4evr@email.com", password: "password", image: Rails.root.join("app/assets/images/ziggy.jpg").open},
    {name: "The Doctor", email:"doctorwho@email.com", password: "password", image: Rails.root.join("app/assets/images/doctor.jpg").open},
    {name: "Ellen Ripley", email:"alienssuck@email.com", password: "password", image: Rails.root.join("app/assets/images/ripley.jpg").open}
    ])

recipes = Recipe.create([
    {name: "No Bake Chocolate Cookies", description: "Chewy, chocolatey, peanut buttery oatmeal cookies that require no bake time!", ingredients: ["quick oats", "cocoa powder", "peanut butter", "sugar"], directions: "Mix all ingredients over low heat, drop by the TBS onto wax paper and let cool.", user_id: 1, image: Rails.root.join("app/assets/images/chocolatecookies.jpg").open},
    {name: "Whiskey on the Rocks", description: "A drink that helps you forget the past and stop caring about the future.", ingredients: ["cheap whiskey", "ice"], directions: "Put them in a glass and drink it already.", user_id: 2, image: Rails.root.join("app/assets/images/whiskey.jpg").open},
    {name: "Blue Sky Rock Candy", description: "It's not what it looks like; it's just sugar for christ's sake, Skylar.", ingredients: ["sugar", "corn syrup", "blue food coloring", "peppermint extract"], directions: "Mix all but the peppermint extract in a beaker and heat to precisely 273 degrees fahrenheit. Allow the mixture to cool to 100 degrees and add the peppermint extract. Pour over wax paper and allow the mixture to cool. Shatter the candy into tiny pieces and sell at a 500% markup.", user_id: 3, image: Rails.root.join("app/assets/images/bluesky.jpg").open},
    {name: "Bantha Milk Smoothie", description: "Just a treat an old friend used to make for me after long days of training. Before you ask, no one knows why it's blue.", ingredients: ["Bantha milk", "Beebleberry ice cream"], directions: "Place the ingredients in a glass, reach out with the force to blend.", user_id: 4, image: Rails.root.join("app/assets/images/bantha.jpg").open},
    {name: "Altered Wontons", description: "Fresh foods are scarce; use what you can find in this variation of a wonton.", ingredients: ["mixed vegetables", "tofu", "wonton wrappers", "egg wash"], directions: "Finely chop your vegetables and tofu. Stir-fry with soy sauce and ginger, or whatever you can find. Wrap them in the wonton wrappers and steam for 15 minutes.", user_id: 5, image: Rails.root.join("app/assets/images/wontons.jpg").open},
    {name: "Chicken", description: "Chicken, good!", ingredients: ["freeze dried chicken substitute"], directions: "Chicken marbles into bowl, put into microwaver. Have chicken!", user_id: 6, image: Rails.root.join("app/assets/images/chicken.jpg").open},
    {name: "Mescal Worm Tacos", description: "Animals? They're all but extinct. But bugs-we've got plenty.", ingredients: ["meal worms", "serrano peppers" "corn tortillas", "salsa", "onions"], directions: "Fry up those meal worms with some salt and serrano peppers. The spice helps you forget you're eating bugs. Roll them up in a tortilla with the salsa and diced onions.", user_id: 7, image: Rails.root.join("app/assets/images/worms.jpg").open},
    {name: "Shepherd's Pie", description: "An old favorite that reminds me of mum.", ingredients: ["ground beef", "peas", "carrots", "onions", "gravy", "mashed potatoes"], directions: "Cook the beef with the veg, and add the gravy. Pour it all in to the pie tin and top it with the mashed potatoes. Bake at 375* for one hour.", user_id: 8, image: Rails.root.join("app/assets/images/shepherdspie.jpg").open},
    {name: "Fish Fingers and Custard", description: "When nothing else hits the spot, go for the fish fingers and custard.", ingredients: ["frozen fish fingers", "boxed custard"], directions: "Have a human cook the fish fingers for you. Dip the fish into the custard; fish custard!", user_id: 9, image: Rails.root.join("app/assets/images/fishcustard.jpg").open},
    {name: "Alien Eggs", description: "Eat them before they eat you.", ingredients: ["xenomorph eggs", "nori"], directions: "Boil the eggs in a solution of vinegar and water for 24 hours. Yes, 24 hours. Unless you want what happened to Kane to happen to you. Peel the egg shells, wrap with nori and eat.", user_id: 10, image: Rails.root.join("app/assets/images/alien.jpg").open}
])