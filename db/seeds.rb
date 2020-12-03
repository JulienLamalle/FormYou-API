User.delete_all
Room.destroy_all
Role.destroy_all
Formation.destroy_all
FormationSession.destroy_all
FormationAttendance.destroy_all
Category.destroy_all
FormationCategory.destroy_all
 
User.reset_pk_sequence
Room.reset_pk_sequence
Role.reset_pk_sequence
Formation.reset_pk_sequence
FormationSession.reset_pk_sequence
FormationAttendance.reset_pk_sequence
Category.reset_pk_sequence
FormationCategory.reset_pk_sequence
 
formations_array = ["React.Js", "Vue.Js", "Node.Js", "Ruby on Rails" , "L'essentiel d'Excel", "Maitrisez Word", "Gérer les équipes", "Créér un environnement de travail sain"]
formations_descriptions_array = ["Prenez en main React, l'outil indispensable à tout développeur web. Découvrez une bibliothèque JavaScript qui vous permet de créer rapidement des interfaces utilisateur très performantes et hautement interactives. Dans cette formation, On vous propose de vous lancer dans le développement complet d'une petite application. Vous verrez comment créer et agencer vos premiers composants pour bâtir l'interface utilisateur. Vous injecterez également des données dynamiques dans votre application et vous mettrez en place les fonctionnalités interactives. Ainsi, vous connaîtrez tous les grands principes de React et vous serez en mesure de créer des applications simples.",  "Si vous souhaitez apporter une solution web moderne à vos applications, découvrez cette formation consacrée à Vue.js. On vous présente ce framework JavaScript populaire utilisé par de nombreuses entreprises telles que Google, Adobe ou Microsoft. Ce cours s'adresse aux développeurs débutants ou de niveau intermédiaire qui ont de bonnes connaissances en HTML, CSS et JavaScript. Vous aborderez un ensemble évolué d'outils qui permet de créer des applications puissantes et performantes, et de vous faire gagner du temps. Ainsi, vous verrez comment développer une application de manière complète et intuitive.", "Dans cette formation, qui s'adresse aux développeurs, vous aborderez Node.js, l'incontournable environnement d'exécution JavaScript. Vous en aborderez les grands principes, puis vous procéderez à son installation, ainsi qu'à celle de tout l'environnement de travail indispensable, dont npm et Microsoft VCS. Au fur et à mesure des chapitres, vous découvrirez, à l'aide d'exemples concrets, les différents modules de Node.js, les opérations I/O asynchrones, les évènements, les streams, les modules Core et les modules npm. Enfin, vous effectuerez une batterie de tests avec un certain nombre d'outils incorporés ou additionnels.", "Embarquez avec nous dans cette découverte exhaustive de Ruby on Rails. Dans cette formation très axée sur la pratique, vous découvrirez ce framework de développement web, qui a notamment servi à créer des services comme Twitter, AirBnB, Groupon et bien d'autres. Vous apprendrez également à créer un Stack Overflow, c'est-à-dire un site d'échange avec système de vote et obtention de badges. Au terme de cette formation, vous serez en mesure de créer vos propres projets avec Ruby on Rails.", "Excel est un outil très riche et très présent dans les petites comme dans les grandes entreprises des secteurs publics ou privés. Comment réussir à naviguer parmi toutes les fonctionnalités proposées par le tableur ? Dans cette formation, on vous donne les clés pour évoluer sur Excel et manipuler efficacement vos données. Ensemble, vous explorerez les principaux outils d'Excel pour Microsoft 365 et vous apprendrez à effectuer des calculs simples et complexes. Vous créerez des tableaux professionnels ainsi que des fonctions avancées telles que des combinaisons de calculs ou des mises en forme conditionnelles. Vous verrez également comment sécuriser vos données et mettre en place vos propres alertes. Ainsi, vous bâtirez des bases solides pour tous vos projets et vous serez en mesure d'utiliser Excel de manière optimale." "Démontrez votre connaissance des applications de la suite Microsoft Office et faites progresser votre carrière professionnelle en maîtrisant Word 2016. Dans le cadre de ce parcours d'apprentissage, apprenez à utiliser l’ensemble des puissantes fonctionnalités de Word et découvrez-en les meilleures pratiques." , "Les dynamiques de groupe influent sur la productivité et la satisfaction des employés. Il est donc vital que les responsables favorisent des relations professionnelles positives. Dans cette formation, on explique comment gérer efficacement une équipe. Vous apprendrez à motiver vos troupes, à gérer les performances de votre équipe, à vous identifier et à asseoir votre autorité. Vous verrez également comment assurer la médiation des conflits et rendre le travail divertissant. Truffée de conseils pratiques et de stratégies utiles, cette formation constitue un excellent point de repère pour les responsables débutants et les plus chevronnés confrontés à un problème spécifique avec leur équipe.", "Les environnements de travail toxiques peuvent coûter très cher aux entreprises en raison de la perte de productivité, des problèmes de santé des employés, voire parfois des litiges. On vous explique comment les organisations qui s’investissent dans le développement d’environnements positifs parviennent à obtenir des retours sur investissement considérables. Si vous souffrez de la négativité dans votre entreprise, vous pouvez mettre en place une nouvelle vision axée sur le changement, avec l’aide d’un comité de culture qui vous aidera à cultiver la positivité. Votre formatrice vous expliquera comment créer des sondages et mettre à jour vos systèmes de gestion de la performance, tout en vous fournissant des supports utiles comme un exemple de plan stratégique et un exercice pour développer vos valeurs d’entreprise." ]
categories_array = ["Programmation", "Logiciel", "Outils bureautiques", "Management"]
rooms_names_array = [ "Épinette rouge",	"Genévrier de Virginie","Mélèze", "Pin blanc","Pin gris",	"Pin rouge","Pin sylvestre","Pruche du Canada", "Sapin baumier","Thuya occidental"]
 
require 'faker'
 
Role.create(name: "student")
Role.create(name: "admin")
Role.create(name: "teacher")
 
 
10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    age: rand(18..99),
    password: "azerty",
    role:  Role.first,
    is_validated: true
  )
  user.save
  puts "User #{user.first_name} created"
end
 
admin = User.create(
  first_name: "admin",
  last_name: "admin",
  email: "admin@yopmail.com",
  age: rand(18..99),
  password: "azerty",
  role:  Role.find_by(name: "admin"),
  is_validated: true
)
puts "User #{admin.first_name} created as admin"
 
teacher = User.create(
  first_name: "teacher",
  last_name: "teacher",
  email: "teacher@yopmail.com",
  age: rand(35..99),
  password: "azerty",
  role:  Role.last,
  is_validated: true
)
puts "User #{teacher.first_name} created as teacher"
 
 
x = 0
formations_array.size.times do
  formation = Formation.create(
    title: formations_array[x],
    description: formations_descriptions_array[x],
    teacher_id: User.last.id
  )
  puts "Seeding formation #{formation.title}"
  x +=1
end 
 
c = 0
rooms_names_array.size.times do
  room = Room.create(
    name: rooms_names_array[c]
  )
  puts "Seeding rooms #{room.name}"
  c += 1
end 
 
 
 
10.times do |i|
  FormationSession.create(
    room:Room.all.sample,
    formation:Formation.all.sample,
    start_date:Time.now,
    end_date:Time.now + 3600*24,
    capacity:rand(1..20)
  )
end 
 
10.times do |i|
  FormationAttendance.create(
    user:User.all.sample,
    formation:Formation.all.sample,
    formation_session:FormationSession.all.sample
  )
end 
 
j = 0
categories_array.size.times do 
  category = Category.create(
    name: categories_array[j]
  )
  puts "Seeding category #{category.name}"
  j +=1
end 
 
f = 0
4.times do 
  FormationCategory.create(
    category: categories_array[0],
    formation: formations_array[f]
  )
  puts "Seeding FormationCategory #{f}"
  f +=1
end 
 
p = 4
2.times do 
  FormationCategory.create(
    category: categories_array[1],
    formation: formations_array[p]
  )
  puts "Seeding FormationCategory #{p}"
  p +=1
end 
 
k = 4
2.times do 
  FormationCategory.create(
    category: categories_array[2],
    formation: formations_array[k]
  )
  puts "Seeding FormationCategory #{k}"
  k +=1
end
 
w = 6
2.times do 
  FormationCategory.create(
    category: categories_array[3],
    formation: formations_array[w]
  )
  puts "Seeding FormationCategory #{w}"
  w +=1
end