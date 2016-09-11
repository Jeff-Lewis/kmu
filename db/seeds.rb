# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#create industry categories
categories = Category.create({name:"Bau- und Erdarbeiten"})
categories = Category.create({name:"Dachdeckerarbeiten"})
categories = Category.create({name:"EDV Telekommunikation"})
categories = Category.create({name:"Elektrikarbeiten"})
categories = Category.create({name:"Entsorgung"})
categories = Category.create({name:"Fenster, Türen, Glas"})
categories = Category.create({name:"Fliesen und Platten"})
categories = Category.create({name:"Garten und Landschaft"})
categories = Category.create({name:"KFZ, Motorrad, Boote"})
categories = Category.create({name:"Maler & Lackierer"})
categories = Category.create({name:"Maurer, Beton, Estrich"})
categories = Category.create({name:"Metallbau, Verarbeitung"})
categories = Category.create({name:"Parkettböden, Teppichböden"})
categories = Category.create({name:"Planung & Beratung"})
categories = Category.create({name:"Putz & Stuck"})
categories = Category.create({name:"Raumausstatter"})
categories = Category.create({name:"Sonstige Dienstleistungen"})
categories = Category.create({name:"Sonstige Handwerkerleistungen"})
categories = Category.create({name:"Treppen- & Innenausbau"})
categories = Category.create({name:"Umzüge, Transporte"})
categories = Category.create({name:"Wege- & Pflasterarbeiten"})
categories = Category.create({name:"Werbung, Druck, Schilder"})
categories = Category.create({name:"Zimmer, Holz, Tischler"})
categories = Category.create({name:"Essen Catering Lebensmittel"})
categories = Category.create({name:"Agrararbeiten"})
categories = Category.create({name:"Finanzberatung"})
categories = Category.create({name:"Vereine"})

#create hotspot categories
hs_categories = HsCategory.create({name:"Museen"})
hs_categories = HsCategory.create({name:"Landschaften"})
hs_categories = HsCategory.create({name:"historische Gebäude"})
hs_categories = HsCategory.create({name:"Sportstätten"})
hs_categories = HsCategory.create({name:"Freizeitparks"})
hs_categories = HsCategory.create({name:"Bäder & Spa"})
hs_categories = HsCategory.create({name:"Seen"})

#create mobilien categories
mob_categories = MobCategory.create({name:"Personentransport"})
mob_categories = MobCategory.create({name:"Lastentransport"})
mob_categories = MobCategory.create({name:"Werkzeuge"})
mob_categories = MobCategory.create({name:"Gartengeräte"})
mob_categories = MobCategory.create({name:"Unterhaltungselektronik"})
mob_categories = MobCategory.create({name:"Sportgeräte"})
mob_categories = MobCategory.create({name:"Computer"})

#create mobilien categories
ev_categories = EvCategory.create({name:"Ausstellung"})
ev_categories = EvCategory.create({name:"Sportanlass"})
ev_categories = EvCategory.create({name:"Konzert"})
ev_categories = EvCategory.create({name:"Vortrag"})
ev_categories = EvCategory.create({name:"Festwirtschaft"})
ev_categories = EvCategory.create({name:"Informationsveranstaltung"})
ev_categories = EvCategory.create({name:"Jubiläum"})
ev_categories = EvCategory.create({name:"Flohmarkt"})

#create ticket categories
ticket_categories = TicketCategory.create({name:"Eintrittsbillet"})
ticket_categories = TicketCategory.create({name:"Gutschein"})
ticket_categories = TicketCategory.create({name:"Rabatt"})

#create Params
appparams = Appparam.create({name:"Kleinanzeigen", description:"Kleinanzeigen für Private Anbieten & Suchen", active:true})
appparams = Appparam.create({name:"Stellenanzeigen", description:"Stellenanzeigen für Institutionen", active:true})
appparams = Appparam.create({name:"Mobilien", description:"Mieten von Mobilen incl. Reservationskalender", active:true})
appparams = Appparam.create({name:"Veranstaltungen", description:"Veranstaltungskalender für Private & Institutionen", active:true})
appparams = Appparam.create({name:"Ausschreibungen", description:"Ausschreibungskalender für Private", active:true})
appparams = Appparam.create({name:"Aktionen", description:"Befristete Sonderaktionen für Institutionen", active:true})
appparams = Appparam.create({name:"Services", description:"Serviceangebot von Institutionen & Privaten", active:true})
appparams = Appparam.create({name:"Institutionen", description:"Institutionen", active:true})
appparams = Appparam.create({name:"Sponsoring", description:"Sponsoring von Events für Institutionen", active:true})
appparams = Appparam.create({name:"Spendeninitiativen", description:"Spendeninitiativen für gemeinnützige Institutionen ", active:true})
appparams = Appparam.create({name:"Rewardinitiativen", description:"Rewardinitiativen mit nicht-monetären Gegenleistungen", active:true})
appparams = Appparam.create({name:"Loaninitiativen", description:"Kreditinitiativen mit Verzinsung", active:true})
appparams = Appparam.create({name:"Spenden", description:"Spenden von Privaten & Institutionen für Spendeninitiativen", active:true})
appparams = Appparam.create({name:"Bewertungen", description:"Bewertung von Produkten & Services von Institutionen & Privaten", active:true})
appparams = Appparam.create({name:"Privatpersonen", description:"Privatpersonen", active:true})
appparams = Appparam.create({name:"Favoriten", description:"Personen & Institutionen folgen", active:true})
appparams = Appparam.create({name:"Sehenswürdigkeiten", description:"Lohnenswerte Ausflugsziele in der Region", active:true})
appparams = Appparam.create({name:"Links", description:"Links der Partnerfirmen", active:true})
appparams = Appparam.create({name:"Wer ist wo", description:"wer ist online", active:true})
appparams = Appparam.create({name:"Kundenberater", description:"Kundenberater für Services", active:true})
appparams = Appparam.create({name:"Kundenstatus", description:"Kundenstatus für Kunden von Partner", active:true})
appparams = Appparam.create({name:"Accounts", description:"Konten für Kunden von Partner", active:true})
appparams = Appparam.create({name:"Transaktionen", description:"Transaktionen", active:true})

path = Rails.root.to_s + "/app/assets/images/sample_pics/"
#create some users...

users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.12.2003", anonymous:false, status:"ok", active:true, email:"horst.wurm@bluewin.ch", password:"password", name:"Horst", lastname:"Wurm", address1:"Hörnliblick 11", address2:"Zezikon", address3:"", superuser:true, avatar:File.open(path+'ma_1.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"1.7.2013", anonymous:false, status:"ok", active:true, email:"t.oschewsky@bluewin.ch", password:"password", name:"Tanja", lastname:"Oschewsky", address1:"Hörnliblick 11", address2:"Zezikon", address3:"", superuser:false,avatar:File.open(path+'ma_3.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.12.2016", anonymous:false, status:"ok", active:true, email:"hans.wurst@gmx.com", password:"password", name:"Hans", lastname:"Wurst", address1:"Bahnhofstrasse 11", address2:"Frauenfeld", address3:"", superuser:false,avatar:File.open(path+'ma_2.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"2.10.2005", anonymous:false, status:"ok", active:true, email:"anton.meier@outlook.com", password:"password", name:"Anton", lastname:"Meier", address1:"Im Roos", address2:"Weinfelden", address3:"", superuser:false,avatar:File.open(path+'ma_4.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.9.2007", anonymous:false, status:"ok", active:true, email:"e.oschewsky@bluewin.ch", password:"password", name:"Emelie", lastname:"Oschewsky", address1:"Hörnliblick 11", address2:"Zezikon", address3:"", superuser:false,avatar:File.open(path+'ma_8.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"11.5.1963", anonymous:false, status:"ok", active:true, email:"henning.gebert@outlook.com", password:"password", name:"Henning", lastname:"Gebert", address1:"Bahnhof", address2:"Pfäffikon SZ", address3:"", superuser:false,avatar:File.open(path+'ma_7.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"1.5.1970", anonymous:false, status:"ok", active:true, email:"heidi.hirsch@outlook.ch", password:"password", name:"Heidi", lastname:"Hirsch", address1:"Hauptstrasse 1", address2:"Amlikon", address3:"", superuser:false, avatar:File.open(path+'ma_9.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"14.4.2003", anonymous:false, status:"ok", active:true, email:"fred.gautschi@bluewin.ch", password:"password", name:"Fred", lastname:"Gautschi", address1:"Dorfplatz 1", address2:"Matzingen", address3:"", superuser:false,avatar:File.open(path+'ma_6.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"6.3.2004", anonymous:false, status:"ok", active:true, email:"christian.meier@gmx.com", password:"password", name:"Christian", lastname:"Meier", address1:"Alte Wilderenstrasse 4", address2:"Zezikon", address3:"", superuser:false,avatar:File.open(path+'ma_2.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.12.2008", anonymous:false, status:"ok", active:true, email:"barak@outlook.com", password:"password", name:"Barak", lastname:"Obama", address1:"Marktplatz", address2:"Frauenfeld", address3:"", superuser:false,avatar:File.open(path+'ma_10.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"26.4.2009", anonymous:false, status:"ok", active:true, email:"trump@bluewin.ch", password:"password", name:"Donald", lastname:"Trump", address1:"Hauptstrasse 1", address2:"Buch", address3:"Thurgau", superuser:false,avatar:File.open(path+'ma_11.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.7.2010", anonymous:false, status:"ok", active:true, email:"angela@outlook.com", password:"password", name:"Angela", lastname:"Merkel", address1:"Bahnhof", address2:"Wil SG", address3:"", superuser:false,avatar:File.open(path+'ma_12.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.7.1970", anonymous:false, status:"ok", active:true, email:"kurt.felix@outlook.com", password:"password", name:"Kurt", lastname:"Felix", address1:"Vadianstrasse 8", address2:"St Gallen", address3:"", superuser:false,avatar:File.open(path+'ma_5.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.7.1969", anonymous:false, status:"ok", active:true, email:"pierin.claglüna@outlook.com", password:"password", name:"Pierin", lastname:"Claglüna", address1:"Bahnhof", address2:"Chur", address3:"", superuser:false,avatar:File.open(path+'ma_13.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.7.1958", anonymous:false, status:"ok", active:true, email:"gregor.stuecheli@outlook.com", password:"password", name:"Gregor", lastname:"Stücheli", address1:"Bahnhof", address2:"Münchwilen", address3:"", superuser:false,avatar:File.open(path+'stuecheli.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"hans.nagel@outlook.com", password:"password", name:"Hans", lastname:"Nagel", address1:"Amriswil", address2:"Hauptstrasse 2", address3:"", superuser:false,avatar:File.open(path+'nagel.jpg', 'rb')})

users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"corinne@outlook.com", password:"password", name:"Corinne", lastname:"Iaonnidis-Sondereggert", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'Corinne-Ioannidis-Sonderegger.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"christoph@outlook.com", password:"password", name:"Christoph", lastname:"Sprenger", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'Christoph-Sprenger.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"aron@outlook.com", password:"password", name:"Aron", lastname:"Gamba", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'Aron_Gamba.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"fabio@outlook.com", password:"password", name:"Fabio", lastname:"Tauro", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'FabioTauro.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"isabelle@outlook.com", password:"password", name:"Isabelle", lastname:"Hugentobler", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'IsabelleHugentobler.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"marco@outlook.com", password:"password", name:"Marco", lastname:"Sonderegger", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'Marco-Sonderegger.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"melanie@outlook.com", password:"password", name:"Melanie", lastname:"Forster", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'MelanieForster2015.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"nunzia@outlook.com", password:"password", name:"Nunzia", lastname:"Seiler", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'NunziaSeiler.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"oliverp@outlook.com", password:"password", name:"Oliver", lastname:"Paulin", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'Oliver_Paulin.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"petrak@outlook.com", password:"password", name:"Petra", lastname:"Koch", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'PetraKoch.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"rschaelchi@outlook.com", password:"password", name:"Raymond", lastname:"Schaelchli", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'RaymondSchaelchli.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"rschoch@outlook.com", password:"password", name:"Remo", lastname:"Schoch", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'RemoSchoch.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"sherzog@outlook.com", password:"password", name:"Stefanie", lastname:"Herzog", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'StefanieHerzog.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"vkirli@outlook.com", password:"password", name:"Vesile", lastname:"Kirli", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'VesileKirli.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"mbueschl@outlook.com", password:"password", name:"Manuela", lastname:"Bueschl", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'ManuelaBueschl.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"ppreite@outlook.com", password:"password", name:"Patric", lastname:"Preite", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'PatricPreite.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"rruckstuhl@outlook.com", password:"password", name:"Ramona", lastname:"Ruckstuhl", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'RamonaRuckstuhl.jpg', 'rb')})

#create some companies...
companies = Company.create({status:"ok", active:true, user_id:1, name:"Fischzucht Hecht", category_id:24 ,stichworte: "Fische, Zierfische, Angelbedarf", address1:"Bahnhof", address2:"Frauenfeld", address3:"Thurgau", avatar:File.open(path+'fischhaendler.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:2, name:"Alder Entsorgung", category_id:11 ,stichworte: "Hocbau, Tiefbau", address1:"Bahnhof", address2:"Wil", address3:"Thurgau", avatar:File.open(path+'alder.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:3, name:"Eisenwaren Müller", category_id:12 ,stichworte: "Hocbau, Tiefbau", address1:"Thurgauer Str", address2:"Matzingen", address3:"Thurgau", avatar:File.open(path+'eisenmueller.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:4, name:"Thurgauer Kantonalbank", partner:true, category_id:26 ,stichworte: "Banken", address1:"Bahnhof", address2:"Weinfelden", address3:"Thurgau", avatar:File.open(path+'tkb.png', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:5, name:"Prematic", category_id:12 ,stichworte: "Luftdruck", address1:"Bahnhof", address2:"Wängi", address3:"Thurgau", avatar:File.open(path+'prematic.png', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:6, name:"Baufirma Meier", category_id:11 ,stichworte: "Hocbau, Tiefbau", address1:"Hauptstrasse", address2:"Zezikon", address3:"Thurgau", avatar:File.open(path+'meier.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:1, name:"Lackierwerkstatt Manser", category_id:9 ,stichworte: "Karosserie", address1:"Amlikon", address2:"Haupstrasse", address3:"Thurgau", avatar:File.open(path+'mazda-mx-5-cabriolet-2006-occasion.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:2, name:"Malermeister Painter", category_id:10 ,stichworte: "Malerarbeiten", address1:"Gartenstrasse 2", address2:"Lommis", address3:"Thurgau", avatar:File.open(path+'maler.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:1, name:"Tierschutzbund Weinfelden", category_id:25 ,stichworte: "Tiere", address1:"Gartenstrasse 2", address2:"Lommis", address3:"Thurgau", social:true, avatar:File.open(path+'tierschutz.png', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:1, name:"Blindenverein Wängi", category_id:9 ,stichworte: "Verein", address1:"Wängi", address2:"Haupstrasse", address3:"Thurgau", avatar:File.open(path+'blindenverein.jpg', 'rb'), social:true}) 
companies = Company.create({status:"ok", active:true, user_id:2, name:"Kosmetikstudio Jasmine", category_id:10 ,stichworte: "Kosmetik", address1:"Gartenstrasse 2", address2:"Bürglen", address3:"Thurgau", avatar:File.open(path+'kosmetik.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:1, name:"Autohaus Hummel", category_id:25 ,stichworte: "Auto KFZ", address1:"Hauptstrasse", address2:"Bissegg", address3:"Thurgau", avatar:File.open(path+'autobissegg.png', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:1, name:"Valiant Bank", category_id:26 ,stichworte: "Bank Finanz Geld", address1:"Bahnhof", address2:"Bern", address3:"Bern", avatar:File.open(path+'valiant.png', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:4, name:"St.Galler Kantonalbank", partner:true, category_id:26 ,stichworte: "Banken", address1:"Bahnhof", address2:"St.Gallen", address3:"St.gallen", avatar:File.open(path+'sgkb.png', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:4, name:"Graubündner Kantonalbank", partner:true, category_id:26 ,stichworte: "Banken", address1:"Bahnhof", address2:"Chur", address3:"Graubünden", avatar:File.open(path+'grkb.png', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:1, name:"Sonderegger publish", partner:false, category_id:22 ,stichworte: "Copyshop Drucken Druckerei Publish Webdesign", address1:"Marktstrasse 26", address2:"8570 Weinfelden", address3:"Thurgau", avatar:File.open(path+'sonderegger.tiff', 'rb')}) 

customers = Customer.create({user_id:1, partner_id:4, customer_number:"uno"+Time.now.to_s})
customers = Customer.create({user_id:2, partner_id:4, customer_number:"uno"+Time.now.to_s})
customers = Customer.create({user_id:3, partner_id:4, customer_number:"uno"+Time.now.to_s})
customers = Customer.create({user_id:4, partner_id:4, customer_number:"uno"+Time.now.to_s})
customers = Customer.create({user_id:5, partner_id:4, customer_number:"uno"+Time.now.to_s})
customers = Customer.create({user_id:6, partner_id:4, customer_number:"uno"+Time.now.to_s})
customers = Customer.create({user_id:7, partner_id:4, customer_number:"uno"+Time.now.to_s})
customers = Customer.create({user_id:8, partner_id:4, customer_number:"uno"+Time.now.to_s})
customers = Customer.create({user_id:9, partner_id:4, customer_number:"uno"+Time.now.to_s})
customers = Customer.create({user_id:10, partner_id:4, customer_number:"uno"+Time.now.to_s})
customers = Customer.create({user_id:11, partner_id:4, customer_number:"uno"+Time.now.to_s})
customers = Customer.create({company_id:1, partner_id:4, customer_number:"cno"+Time.now.to_s})
customers = Customer.create({company_id:2, partner_id:4, customer_number:"cno"+Time.now.to_s})
customers = Customer.create({company_id:3, partner_id:4, customer_number:"cno"+Time.now.to_s})
customers = Customer.create({company_id:4, partner_id:4, customer_number:"cno"+Time.now.to_s})
customers = Customer.create({company_id:5, partner_id:4, customer_number:"cno"+Time.now.to_s})
customers = Customer.create({company_id:6, partner_id:4, customer_number:"cno"+Time.now.to_s})
customers = Customer.create({company_id:7, partner_id:4, customer_number:"cno"+Time.now.to_s})
customers = Customer.create({company_id:8, partner_id:4, customer_number:"cno"+Time.now.to_s})
customers = Customer.create({company_id:9, partner_id:4, customer_number:"cno"+Time.now.to_s})
customers = Customer.create({company_id:10, partner_id:4, customer_number:"cno"+Time.now.to_s})
customers = Customer.create({company_id:11, partner_id:4, customer_number:"cno"+Time.now.to_s})
customers = Customer.create({user_id:13, partner_id:14, customer_number:"cno"+Time.now.to_s})
customers = Customer.create({user_id:14, partner_id:15, customer_number:"cno"+Time.now.to_s})

for i in 1..20
    accounts = Account.create({customer_id:i.to_i, name:"Konto-Nr."+i.to_s, iban:"IBAN1234567890"+i.to_s, is_account_ver:true})
end
accounts = Account.create({customer_id:23, name:"SGKB Konto-Nr.12345", iban:"IBAN1234567890"+i.to_s, is_account_ver:true})
accounts = Account.create({customer_id:24, name:"GRKB Konto-Nr.12345", iban:"IBAN1234567890"+i.to_s, is_account_ver:true})

transactions = Transaction.create({user_id:2, company_id:nil, account_ver:1, account_bel:2, trx_date:Date.today, valuta:Date.today+1, status:"erfasst", ref: "dies ist eine Test-Transaktion", object_name:"User", object_id:1, amount:100})
transactions = Transaction.create({user_id:3, company_id:nil, account_ver:1, account_bel:3, trx_date:Date.today, valuta:Date.today+1, status:"erfasst", ref: "dies ist eine Test-Transaktion", object_name:"User", object_id:1, amount:100})
transactions = Transaction.create({user_id:4, company_id:nil, account_ver:1, account_bel:4, trx_date:Date.today, valuta:Date.today+1, status:"erfasst", ref: "dies ist eine Test-Transaktion", object_name:"User", object_id:1, amount:100})
transactions = Transaction.create({user_id:5, company_id:nil, account_ver:3, account_bel:2, trx_date:Date.today, valuta:Date.today+1, status:"erfasst", ref: "dies ist eine Test-Transaktion", object_name:"User", object_id:1, amount:100})
transactions = Transaction.create({user_id:6, company_id:nil, account_ver:4, account_bel:2, trx_date:Date.today, valuta:Date.today+1, status:"erfasst", ref: "dies ist eine Test-Transaktion", object_name:"User", object_id:1, amount:100})

partnerlinks = PartnerLink.create({active:true, company_id:4, name:"eBanking", link:"www.tkb.ch/ebanking"})
partnerlinks = PartnerLink.create({active:true, company_id:4, name:"Kunden Webportal", link:"https://www.tkb.ch/default/online-schalter/adressaenderung.htm"})

#partnerlinks = PartnerLink.create({active:true, company_id:4, name:"Terminvereinbarung", link:"https://www.tkb.ch/default/online-schalter/adressaenderung.htm"})
#partnerlinks = PartnerLink.create({active:true, company_id:4, name:"Formularbestellung", link:"https://www.tkb.ch/default/online-schalter/bestellung-zv-formulare.htm"})
#partnerlinks = PartnerLink.create({active:true, company_id:4, name:"Reisegeldbestellung", link:"https://www.tkb.ch/default/online-schalter/reisegeld.htm"})
#partnerlinks = PartnerLink.create({active:true, company_id:4, name:"Geschäftstellen", link:"https://www.tkb.ch/private/service/geschaeftsstellen.htm"})
#partnerlinks = PartnerLink.create({active:true, company_id:4, name:"Bancomaten", link:"https://www.tkb.ch/private/service/tkb_bancomaten.htm"})

#create some company services..
services = Service.create({status:"ok", active:true, company_id:1, parent_id:0, stype:"regular", name:"frische Fische", social:false,avatar:File.open(path+'fische.jpg', 'rb')})
rats = Rating.create({status:"ok", service_id:1, user_id:4, user_rating:4, user_comment:"besser geht's nicht" })
rats = Rating.create({status:"ok", service_id:1, user_id:5, user_rating:3, user_comment:"sehr gut" })
rats = Rating.create({status:"ok", service_id:1, user_id:2, user_rating:3, user_comment:"ganz ok aber durchschnittlich" })

services = Service.create({status:"ok", active:true, company_id:1, parent_id:0, stype:"regular", name:"Fischbuffet", social:false,avatar:File.open(path+'fischbuffet.jpg', 'rb')})
rats = Rating.create({status:"ok", service_id:2, user_id:1, user_rating:1, user_comment:"unterirdisch" })
rats = Rating.create({status:"ok", service_id:2, user_id:2, user_rating:2, user_comment:"naja" })
rats = Rating.create({status:"ok", service_id:2, user_id:2, user_rating:1, user_comment:"nicht empfehlenswert" })

services = Service.create({status:"ok", active:true, company_id:2, parent_id:0, stype:"regular", name:"Baggerarbeiten", social:false, avatar:File.open(path+'bagger.jpg', 'rb')})
services = Service.create({status:"ok", active:true, company_id:2, parent_id:0, stype:"regular", name:"Baumeisterarbeiten", social:false, avatar:File.open(path+'hochbau.jpg', 'rb')})
services = Service.create({status:"ok", active:true, company_id:2, parent_id:0, stype:"regular", name:"Innenausbau", social:false, avatar:File.open(path+'keller.jpg', 'rb')})
services = Service.create({status:"ok", active:true, company_id:3, parent_id:0, stype:"regular", name:"Metalldrehteile aller Art", social:false, avatar:File.open(path+'dach.jpg', 'rb')})
services = Service.create({status:"ok", active:true, company_id:4, parent_id:0, stype:"regular", name:"Anlegen", avatar:File.open(path+'anlegen.jpg', 'rb'), social:false})
services = Service.create({status:"ok", active:true, company_id:4, parent_id:0, stype:"regular", name:"Finanzieren", social:false, avatar:File.open(path+'finanzieren.jpg', 'rb')})
services = Service.create({status:"ok", active:true, company_id:4, parent_id:0, stype:"regular", name:"Vorsorgen", social:false,avatar:File.open(path+'vorsorgen.jpg', 'rb')})
services = Service.create({status:"ok", active:true, company_id:4, parent_id:0, stype:"regular", name:"Erben", social:false,avatar:File.open(path+'erbschaft.jpg', 'rb')})
services = Service.create({status:"ok", active:true, company_id:4, parent_id:0, stype:"regular", name:"Steuern", social:false,avatar:File.open(path+'steuern.jpg', 'rb')})
services = Service.create({status:"ok", active:true, company_id:4, parent_id:0, stype:"regular", name:"Kinder und Jugendliche", social:false,avatar:File.open(path+'young.jpg', 'rb')})
services = Service.create({status:"ok", active:true, company_id:5, parent_id:0, stype:"regular", name:"Maschinen Luftdruck", social:false, avatar:File.open(path+'luftdruck.jpg', 'rb')})

services = Service.create({status:"ok", active:true, company_id:16, parent_id:0, stype:"regular", name:"Project & Services", description:"Medien­projekt­management    Als Generalunternehmer begleiten wir Ihr Projekt von der Idee bis zur Publikation. Egal ob elektronisch oder gedruckt, ob inhouse produziert oder extern bei einem unserer Partner.

Individualität zeichnet unsere Kunden und ihre Wünsche und Bedürfnisse aus. Gefragt ist deshalb ein Leistungsangebot, das von der Konzeption bis zum fertigen Druckerzeugnis alles beinhaltet. Aber immer aus einer Hand. Wir verstehen uns als ein Generalunternehmen, das in der ganzen grafischen Industrie zu Hause ist. In den vergangenen 60 Jahren haben wir zuverlässige Netzwerke mit unseren Partnern aufgebaut. Wir erfüllen auch den ausgefallensten Wunsch, für den es entweder hochspezialisiertes Wissen oder aussergewöhnliche Maschinen benötigt. Was immer Sie möchten, Sie bekommen es. Die Zusammenarbeit richtet sich nach individueller Planung – und immer so, dass Sie das Gewünschte wirklich aus einer Hand bekommen. Aus erster Hand!

Es ist das Ziel unserer Kundenberater, Ihnen die wirtschaftlichste, optimalste und kostengünstigste Produktionsvariante anzubieten. Profitieren Sie von der Erfahrung unserer Kundenberater und von unserem breiten Netzwerk an Spezialisten.", social:false, avatar:File.open(path+'luftdruck.jpg', 'rb')})
services = Service.create({status:"ok", active:true, company_id:16, parent_id:0, stype:"regular", name:"Create & Design", description: "Mediengestaltung    Wir sind zwar keine Werbeagentur. Trotzdem haben unsere Grafiker kreative Ideen und gestalterisches Flair. Wenn Sie ein bereits bestehendes Konzept oder eine Idee für ein Projekt haben, sind Sie bei uns genau richtig!

Wir setzen Ihre Ideen visuell um oder realisieren Ihre Drucksachen unter Berücksichtigung von bestehenden Corporate-Design-Vorgaben. Bei grösseren Projekten mit Bedarf an Konzeption und Design arbeiten wir eng mit unseren Agenturpartnern zusammen.", social:false, avatar:File.open(path+'luftdruck.jpg', 'rb')})
services = Service.create({status:"ok", active:true, company_id:16, parent_id:0, stype:"regular", name:"DTP & Premedia", description: "Medienvorstufe    Ob als Bestandteil einer unserer Gesamtlösungen oder als eigenständige Dienstleistung: Wir sind Ihr kompetenter Partner in allen Anliegen rund um digitale Medienaufbereitung.

Lassen Sie Ihre Druckvorstufe, egal in welcher Sprache, komplett von uns erstellen. Wir kümmern uns um die typografischen Feinheiten und bereiten die Daten drucktechnisch auf. Oder nutzen Sie eines unserer Online-Tools zur Druckvorstufenherstellung.

Einfache und anspruchsvolle Bildretuschen gehören ebenfalls zu unseren Spezialitäten. So kann Ungewolltes wegretuschiert oder Erwünschtes ergänzt werden. Unser ins Colormanagement eingebundene Proofingsystem sorgt für Kontrolle und Farbsicherheit und führt zu Übereinstimmung zwischen Proof und Druck. Nutzen Sie unser Fotostudio. Unser Fotograf realisiert Ihre Wünsche direkt vor Ort oder bei uns im Haus. Im Korrektorat und Lektorat sind zwei geprüfte Korrektorinnen für uns tätig. Korrekturarbeiten und Übersetzungen in Fremdsprachen übernehmen für uns renommierte Übersetzungsbüros. Nach Fertigstellung des Auftrags werden die Daten archiviert und können jederzeit abgerufen werden.

Da die Kommunikation zunehmend auf Datenbanken und Internet basiert, ist eine sinnvolle Ergänzung zum Gedruckten immer naheliegender, zumal dadurch ein Mehrfachnutzen entsteht. Gerne unterstützen wir Sie bei Ihren elektronischen Projekten. Ob Produktion per Redaktionssystem, Bestellung über Webshop, Publikation über Database-Publishing oder Personalisierungen (Bild und/oder Text). Wir haben eine massgeschneiderte Lösung für Sie bereit.", social:false, avatar:File.open(path+'luftdruck.jpg', 'rb')})
services = Service.create({status:"ok", active:true, company_id:16, parent_id:0, stype:"regular", name:"Outline & Design", description:"Media- und Websolutions    In Zusammenarbeit mit interactive friends ag aus Rorschach bieten wir sowohl Standardlösungen wie auch individuelle Lösungen im Online-Bereich an. Dazu haben wir gemeinsam die Firma Sonderegger Interactive AG gegründet.

Wir leben und lieben interaktive Kommunikation im digitalen Zeitalter. Indem wir klassische und digitale Medien gekonnt synchronisieren und einsetzen, erreichen wir Kunden auf allen Kanälen effizient.

Ihr Vorteil
Ein Ansprechpartner für Druck und Online
Vielfältige Möglichkeiten für Ihre crossmedialen Projekte dank Kombination von Print und Web
Breites Angebot an Online-/Mobile-Produkten
Realisierung von Standardlösungen aber auch hoch individualisierte Projekte
Über 15 Jahre Erfahrung aus mehr als 1’000 Online-Projekten
Einige Anwendungsbeispiele
Übersichtliche und einfache Websites
Grössere Corporate Websites
Landing- und Promopages
Crossmedia-Projekte
Online-Shops
Smartphone- und Tablet-Lösungen (Blätterbare Magazin/Kataloge)
Newsletter und E-Mail-Marketing
Social Media und Redaktion
Online-Videos
AdWords, Facebook Ads
Alle Leistungen inkl. Redaktion und Bildkonzept
und vieles mehr …
Professionelle Webauftritte zum Fixpreis
Die Web-Basispakete sind jederzeit durch eine Vielzahl verschiedener Module und Erweiterungen ausbaufähig – damit Ihre Website flexibel und effizient mit den Bedürfnissen Ihres Unternehmens wachsen kann. Als Auswahl: Downloads, Gallery, Search, Agenda, Video, Jobs, Newsletter, E-Book, Webshop light, Article.", social:false, avatar:File.open(path+'luftdruck.jpg', 'rb')})
services = Service.create({status:"ok", active:true, company_id:16, parent_id:0, stype:"regular", name:"Print & Press", description: "Offset- und Digitaldruck    Das Drucken ist weiterhin unser Kerngeschäft. Seit 1949 produzieren wir qualitativ hochstehende Printprodukte in allen Varianten.

Für die Produktion von Broschüren, Prospekten, Zeitschriften, Katalogen, Jahresberichten, Büchern sowie diversen Werbe- und Geschäftsdrucksachen wie Flyer, Briefbogen, Couverts und Visitenkarten im Bogenoffsetdruckverfahren stehen insgesamt 12 hochmoderne Druckwerke bis zum Format 70/100 zur Verfügung. Wir verarbeiten sowohl Dünndruckpapiere als auch Karton bis zu einer Stärke von 1 mm. Um Ihren Drucksachen den gewissen Glanz oder das gewisse Etwas zu verleihen, können diese auf unseren Maschinen dispersionslackiert (auch mit Duftlack), geprägt, gerillt, perforiert oder gestanzt werden.

Für Drucksachen in Grossauflagen arbeiten wir eng mit Spezialisten im Bereich Rollenoffsetdruck zusammen. Leistungsstarke Rollenoffsetmaschinen fertigen Ihr Produkt in hochwertiger Qualität, perfekt ausgerüstet und zu einem optimalen Preis-Leistungs-Verhältnis.

Benötigen Sie zielgruppengerechte Drucksachen, kleine Auflagen oder Unikate? Wir erfüllen Ihre Wünsche im Digitaldruck für höchste Ansprüche bis zum Format A1. Auch personalisierte Drucksachen lassen sich einfach realisieren. Unsere Digitaldruckmaschinen bieten Ihnen eine dynamische, hochauflösende Bildqualität, eine breite Farbskala und die Möglichkeit zur Anwendung von partiellen Lackeffekten (Clear Dry Ink). Überzeugen Sie sich von unserem Preis-Leistungs-Verhältnis.", social:false, avatar:File.open(path+'luftdruck.jpg', 'rb')})
services = Service.create({status:"ok", active:true, company_id:16, parent_id:0, stype:"regular", name:"Posters & Signs", description:"Beschriftungstechnik    Durch Übernahme der Firma Repro Design GmbH im Jahr 2012 haben wir unsere Angebotspalette umfangreich erweitert. Grossformatdruck, Beschriftungen und Werbetechnik gehören nun ebenfalls zu unseren Spezialitäten.

Wichtige Botschaften brauchen manchmal eben viel Platz! Deshalb bedrucken wir auch richtig grosse Formate, denn manchmal ist mehr eben mehr. Mit Solventdruck geht das sogar für den Einsatzbereich draussen, UV-lichtecht. Was aber besonders beeindruckend ist: die Vielzahl von Bedruckstoffen, auf die wir Ihre Sujets reproduzieren können. Fotopapiere und Blachen, Backlitfolien, Fahnenstoffe, Leinwände, Klebefolien – und noch viel mehr. Lassen Sie Ihren Ideen freien Lauf: Posterprint (matt oder glänzend), Leinwandbilder, Blachen (inkl. Säumen und Ösen), Synthetikpapier (reissfest), Fahnenstoff, Klebefolie (auch transparent), Windowfolie, Glasdekorfolie und vieles mehr.

Es gibt kaum etwas, worauf wir Ihre Botschaft nicht aufbringen können. Es braucht viel Know-how um die richtige Technik auszuwählen, und meistens noch mehr Fingerspitzengefühl bei der sauberen Ausführung. Wir bedrucken und bekleben fast alles und nutzen dafür unterschiedlichste Materialien, damit Wirkung und Haltbarkeit perfekt auf die jeweilige Aufgabe abgestimmt sind. Die Gestaltungsmöglichkeiten am Objekt sind schier unerschöpflich – besprechen Sie Ihre Ideen mit uns, und wir sagen Ihnen, wie sie umgesetzt werden können. Einige Beispiele für Beschriftungen und Werbetechnik: Werbetafeln (im Innen- und Aussenbereich), Fahrzeuge und Fahrzeuganhänger (als mobile Werbeflächen), Schaufenster (aussen und innen), Büros und Eingangsbereiche (Logos, Beschriftungen, Öffnungszeiten), Glasdekor- und Windowfolien (Sichtschutz und Veredelung) und vieles mehr.", social:false, avatar:File.open(path+'luftdruck.jpg', 'rb')})
services = Service.create({status:"ok", active:true, company_id:16, parent_id:0, stype:"regular", name:"Bind & Book", description:"Druckweiter­verarbeitung    Wir sagen gerne: «Fertig ist das Druckprodukt, wenn es der Kunde in den Händen hält.» Damit meinen wir, dass ein Produkt nach dem Drucken meistens noch nicht fertig ist – im Gegenteil, oftmals beginnt es erst dann richtig zu entstehen.

Deshalb bieten wir eine breite Palette an individuellen Möglichkeiten, um Ihren Druckprodukten den letzten Schliff zu verpassen. Zum Beispiel: Binden (Draht-, Spiral- und Thermobindung), Aufziehen (auf Polystyrol, Forex, Aluminium, Kunstoff), Laminieren (zur Erhöhung von Schutz und Haltbarkeit / matt oder glänzend), Sortieren, Falzen, Lochen (2- bis 4-fach), Rillen, Heften und Stanzen.

", social:false, avatar:File.open(path+'luftdruck.jpg', 'rb')})
services = Service.create({status:"ok", active:true, company_id:16, parent_id:0, stype:"regular", name:"Logistics & Letters", description:"Medien­logistik­lösungen    Viel zu wichtig, um vergessen zu gehen: Wer schnell produziert, muss auch die Logistik im Griff haben. Schliesslich haben Drucksachen etwas gemeinsam: Sie haben einen Empfänger.

Wir unterstützen Sie kompetent bei der Versandplanung, beim Adressieren, Kuvertieren, Etikettieren sowie bei der Postaufgabe im In- und Ausland. Auch für personalisierte Mailings jeglicher Art sind Sie bei uns am richtigen Ort. Sollten Sie wenig Platz haben, können Sie Ihre Drucksachen bei uns einlagern. Rufen Sie uns an, unsere Berater stehen Ihnen gerne zur Verfügung.", social:false, avatar:File.open(path+'luftdruck.jpg', 'rb')})


path2 = Rails.root.to_s + "/app/assets/images/sample_pdfs/"
servicedocs = ServiceDocument.create({service_id:7, name:"Finanzplanung allgm.", avatar:File.open(path2+'anlegen.jpg', 'rb'), document:File.open(path2+'anlegen.pdf', 'rb')})
servicedocs = ServiceDocument.create({service_id:7, name:"Finanzplanung", avatar:File.open(path2+'anlegen.jpg', 'rb'), document:File.open(path2+'finanzplanung.pdf', 'rb')})
servicedocs = ServiceDocument.create({service_id:10, name:"Erbschaft", avatar:File.open(path2+'erben.jpg', 'rb'), document:File.open(path2+'erbschaft.pdf', 'rb')})
servicedocs = ServiceDocument.create({service_id:10, name:"Erbrecht", avatar:File.open(path2+'erben.jpg', 'rb'), document:File.open(path2+'erbrecht.pdf', 'rb')})
servicedocs = ServiceDocument.create({service_id:11, name:"Steuerberatung", avatar:File.open(path2+'steuerberatung.jpg', 'rb'), document:File.open(path2+'steuerberatung.pdf', 'rb')})
servicedocs = ServiceDocument.create({service_id:11, name:"Steuern", avatar:File.open(path2+'steuerberatung.jpg', 'rb'), document:File.open(path2+'steuern.pdf', 'rb')})
servicedocs = ServiceDocument.create({service_id:12, name:"Kids Club", avatar:File.open(path2+'young.jpg', 'rb'), document:File.open(path2+'kids.pdf', 'rb')})
servicedocs = ServiceDocument.create({service_id:12, name:"Blockbuster", avatar:File.open(path2+'young.jpg', 'rb'), document:File.open(path2+'kids2.pdf', 'rb')})

advisors = Advisor.create({user_id:1, service_id:8, grade:"Senior Berater"})
advisors = Advisor.create({user_id:2, service_id:8, grade:"Senior Berater"})
advisors = Advisor.create({user_id:3, service_id:8, grade:"Berater"})
advisors = Advisor.create({user_id:4, service_id:9, grade:"Berater"})
advisors = Advisor.create({user_id:4, service_id:10, grade:"Berater"})
advisors = Advisor.create({user_id:3, service_id:9, grade:"Berater"})
advisors = Advisor.create({user_id:5, service_id:10, grade:"Senior Berater"})
advisors = Advisor.create({user_id:6, service_id:10, grade:"Berater"})
advisors = Advisor.create({user_id:7, service_id:11, grade:"Senior Berater"})
advisors = Advisor.create({user_id:8, service_id:11, grade:"Berater"})
advisors = Advisor.create({user_id:9, service_id:11, grade:"Senior Berater"})
advisors = Advisor.create({user_id:10, service_id:11, grade:"Senior Berater"})
advisors = Advisor.create({user_id:9, service_id:8, grade:"Berater"})
advisors = Advisor.create({user_id:10, service_id:9, grade:"Berater"})
advisors = Advisor.create({user_id:11, service_id:9, grade:"Berater"})

advisors = Advisor.create({user_id:17, service_id:14, grade:"Berater"})
advisors = Advisor.create({user_id:18, service_id:14, grade:"Berater"})
advisors = Advisor.create({user_id:28, service_id:14, grade:"Berater"})
advisors = Advisor.create({user_id:30, service_id:14, grade:"Berater"})

advisors = Advisor.create({user_id:18, service_id:15, grade:"Berater"})
advisors = Advisor.create({user_id:26, service_id:15, grade:"Berater"})

advisors = Advisor.create({user_id:27, service_id:16, grade:"Berater"})

advisors = Advisor.create({user_id:17, service_id:17, grade:"Berater"})
advisors = Advisor.create({user_id:31, service_id:17, grade:"Berater"})
advisors = Advisor.create({user_id:32, service_id:17, grade:"Berater"})

advisors = Advisor.create({user_id:28, service_id:18, grade:"Berater"})
advisors = Advisor.create({user_id:17, service_id:18, grade:"Berater"})
advisors = Advisor.create({user_id:18, service_id:18, grade:"Berater"})
advisors = Advisor.create({user_id:20, service_id:18, grade:"Berater"})
advisors = Advisor.create({user_id:21, service_id:18, grade:"Berater"})
advisors = Advisor.create({user_id:33, service_id:18, grade:"Berater"})
advisors = Advisor.create({user_id:30, service_id:18, grade:"Berater"})
advisors = Advisor.create({user_id:23, service_id:18, grade:"Berater"})

advisors = Advisor.create({user_id:33, service_id:19, grade:"Berater"})
advisors = Advisor.create({user_id:23, service_id:19, grade:"Berater"})
advisors = Advisor.create({user_id:26, service_id:19, grade:"Berater"})

advisors = Advisor.create({user_id:19, service_id:20, grade:"Berater"})

advisors = Advisor.create({user_id:19, service_id:21, grade:"Berater"})
advisors = Advisor.create({user_id:21, service_id:21, grade:"Berater"})

appointments = Appointment.create({user_id1:1, user_id2:12, subject:"Finanzieren", active:true, status:"angefragt", app_date:Date.today, time_from:8, time_to:10, channel:"Geschäftsstelle", channel_detail:""})
appointments = Appointment.create({user_id1:1, user_id2:11, subject:"Finanzieren", active:true, status:"angefragt", app_date:Date.today, time_from:12, time_to:13, channel:"Geschäftsstelle", channel_detail:""})
appointments = Appointment.create({user_id1:2, user_id2:10, subject:"Finanzieren", active:true, status:"angefragt", app_date:Date.today+1, time_from:8, time_to:10, channel:"Geschäftsstelle", channel_detail:""})
appointments = Appointment.create({user_id1:2, user_id2:9, subject:"Finanzieren", active:true, status:"angefragt", app_date:Date.today+1, time_from:9, time_to:10, channel:"Geschäftsstelle", channel_detail:""})
appointments = Appointment.create({user_id1:3, user_id2:8, subject:"Finanzieren", active:true, status:"angefragt", app_date:Date.today+2, time_from:15, time_to:18, channel:"Geschäftsstelle", channel_detail:""})
appointments = Appointment.create({user_id1:3, user_id2:7, subject:"Finanzieren", active:true, status:"angefragt", app_date:Date.today+3, time_from:7, time_to:8, channel:"Geschäftsstelle", channel_detail:""})

services = Service.create({status:"ok", active:true, company_id:1, parent_id:0, stype:"action", name:"Fischbuffet zum halben Preis", date_from:Date.today+5, date_to:Date.today+10, avatar:File.open(path+'fischbuffet.jpg', 'rb')})
services = Service.create({status:"ok", active:true, company_id:11, parent_id:0, stype:"action", name:"Gesichtsbehandlung 50% Rabatt", date_from:Date.today, date_to:Date.today+5, avatar:File.open(path+'gesicht.jpg', 'rb')})
rats = Rating.create({status:"ok", service_id:14, user_id:1, user_rating:4, user_comment:"Wahnsinn für den Preis" })
rats = Rating.create({status:"ok", service_id:14, user_id:2, user_rating:5, user_comment:"absolut Super" })
rats = Rating.create({status:"ok", service_id:14, user_id:4, user_rating:5, user_comment:"absolut empfehlenswert" })
rats = Rating.create({status:"ok", service_id:14, user_id:5, user_rating:4, user_comment:"genialer Service" })
rats = Rating.create({status:"ok", service_id:14, user_id:6, user_rating:5, user_comment:"prima immer wieder" })
rats = Rating.create({status:"ok", service_id:14, user_id:8, user_rating:6, user_comment:"total empfehlenswert" })

services = Service.create({status:"ok", active:true, company_id:12, parent_id:0, stype:"action", name:"Superrabatt Golf!!!", date_from:Date.today, date_to:Date.today + 10, avatar:File.open(path+'vwgolf.jpg', 'rb')})
rats = Rating.create({status:"ok", service_id:15, user_id:1, user_rating:1, user_comment:"Lockangebot - Fahrzeug gibt es gar nicht" })
rats = Rating.create({status:"ok", service_id:15, user_id:2, user_rating:2, user_comment:"Fahrzeug war dann plötzlich verkauft" })
rats = Rating.create({status:"ok", service_id:15, user_id:7, user_rating:1, user_comment:"Fahrzeuig konnte nicht bsichtigt werden und man wollte uns einen anderen viel teueren Wagen andrehen" })

#create some user services..
services = Service.create({status:"ok", active:true, user_id:1, parent_id:0, stype:"regular", name:"Altenpflege", avatar:File.open(path+'altenpflege.jpg', 'rb'), social:true})
rats = Rating.create({status:"ok", service_id:16, user_id:1, user_rating:5, user_comment:"echter good citizend " })
rats = Rating.create({status:"ok", service_id:16, user_id:2, user_rating:5, user_comment:"wunderbares ehrenamtliches Engagement" })

services = Service.create({status:"ok", active:true, user_id:1, parent_id:0, stype:"regular", name:"Gitarrenunterricht", avatar:File.open(path+'gitarrenunterricht.jpg', 'rb'), social:false})
rats = Rating.create({status:"ok", service_id:17, user_id:1, user_rating:5, user_comment:"cooler Unterricht - nie langweilig" })
rats = Rating.create({status:"ok", service_id:17, user_id:2, user_rating:5, user_comment:"kurzweilig und spannend" })

services = Service.create({status:"ok", active:true, user_id:2, parent_id:0, stype:"regular", name:"Mathe Nachhilfe", avatar:File.open(path+'mathe.jpg', 'rb'), social:true})
rats = Rating.create({status:"ok", service_id:18, user_id:5, user_rating:2, user_comment:"vielleicht kann man Mathe nicht besser unterrichten" })
rats = Rating.create({status:"ok", service_id:18, user_id:6, user_rating:3, user_comment:"naja auf alle Fälle besser als bei meinem Lehrer" })

services = Service.create({status:"ok", active:true, user_id:2, parent_id:0, stype:"regular", name:"Spanisch Unterricht", avatar:File.open(path+'spanisch.jpg', 'rb'), social:false})
rats = Rating.create({status:"ok", service_id:19, user_id:7, user_rating:5, user_comment:"mui bien" })
rats = Rating.create({status:"ok", service_id:19, user_id:8, user_rating:4, user_comment:"perfecto" })

services = Service.create({status:"ok", active:true, user_id:2, parent_id:0, stype:"regular", name:"Englisch Unterricht", avatar:File.open(path+'english.png', 'rb'), social:false})
services = Service.create({status:"ok", active:true, user_id:3, parent_id:0, stype:"regular", name:"Gartenarbeit", avatar:File.open(path+'gartenarbeit.jpg', 'rb'), social:false})
services = Service.create({status:"ok", active:true, user_id:4, parent_id:0, stype:"regular", name:"Einkaufen", avatar:File.open(path+'shopping.jpg', 'rb'), social:true})
rats = Rating.create({status:"ok", service_id:23, user_id:7, user_rating:5, user_comment:"immer freundlich und zuvorkommend" })
rats = Rating.create({status:"ok", service_id:23, user_id:8, user_rating:4, user_comment:"besser geht es nicht" })

#create some immobilien und calendereinträge..
vehicles = Vehicle.create({status:"ok", active:true, time_from: 8, time_to: 17, mob_category_id:1, user_id:1, name:"Kleinbagger", address1:"Frauenfeld", address2:"Almend", address3:"Schweiz", avatar:File.open(path+'bagger.jpg', 'rb') })
vehicles = Vehicle.create({status:"ok", active:true, time_from: 8, time_to: 17, mob_category_id:1, user_id:1, name:"Lastwagen 7.5t", address1:"Wil", address2:"Bahnhofstrasse", address3:"Schweiz", avatar:File.open(path+'lkw75.jpg', 'rb')})
vehicles = Vehicle.create({status:"ok", active:true, time_from: 8, time_to: 17, mob_category_id:2, user_id:2, name:"Zügelwagen 7.5t", address1:"St.Gallen", address2:"Rotmonten", address3:"Schweiz", avatar:File.open(path+'lkw35.jpg', 'rb')})
vehicles = Vehicle.create({status:"ok", active:true, time_from: 8, time_to: 17, mob_category_id:2, user_id:2, name:"Gartenpflug", address1:"Weinfelden", address2:"Im Roos", address3:"Schweiz", avatar:File.open(path+'gartenpflug.jpg', 'rb')})
vehicles = Vehicle.create({status:"ok", active:true, time_from: 8, time_to: 17, mob_category_id:2, company_id:2, name:"Anhänger 2.0t", address1:"Berg", address2:"Hautpstrasse", address3:"Schweiz", avatar:File.open(path+'anhaenger20.jpg', 'rb')})
vehicles = Vehicle.create({status:"ok", active:true, time_from: 8, time_to: 17, mob_category_id:3, company_id:3, name:"Anhänger 600kg", address1:"Amlikon", address2:"Dorfstrasse", address3:"Schweiz", avatar:File.open(path+'anhaenger600.jpg', 'rb')})
vehicles = Vehicle.create({status:"ok", active:true, time_from: 8, time_to: 17, mob_category_id:3, company_id:1, name:"Kleinbus 20 Personen", address1:"Tobel", address2:"Bahnhof", address3:"Schweiz", avatar:File.open(path+'kleinbus.jpg', 'rb')})
calenders = Calender.create({status:"ok", active:true, vehicle_id:1, user_id:4, date_from:DateTime.now, date_to:DateTime.now+1, time_from:10, time_to:12})
calenders = Calender.create({status:"ok", active:true, vehicle_id:1, user_id:4, date_from:DateTime.now, date_to:DateTime.now+1, time_from:10, time_to:12})
calenders = Calender.create({status:"ok", active:true, vehicle_id:1, user_id:5, date_from:DateTime.now+1, date_to:DateTime.now+2, time_from:10, time_to:11})
calenders = Calender.create({status:"ok", active:true, vehicle_id:2, user_id:5, date_from:DateTime.now+2, date_to:DateTime.now+4, time_from:10, time_to:14})
calenders = Calender.create({status:"ok", active:true, vehicle_id:2, user_id:6, date_from:DateTime.now+4, date_to:DateTime.now+5, time_from:10, time_to:15})
calenders = Calender.create({status:"ok", active:true, vehicle_id:4, user_id:7, date_from:DateTime.now, date_to:DateTime.now+3, time_from:10, time_to:16})

#create some bids..
bids = Bid.create({status:"ok", category_id:8, active:true, user_id:1, date_from:DateTime.now, date_to:DateTime.now+30, name:"Umbau Keller", address1:"Zezikon", address2:"Hörnliblick", address3:"", description:"baue meinen keller um. Ca. 80qm"})
biddetails = BidDetail.create({status:"ok", bid_id:1, name:"Bild 1", avatar:File.open(path+'keller.jpg', 'rb')})
biddetails = BidDetail.create({status:"ok", bid_id:1, name:"Bild 2", avatar:File.open(path+'keller1.jpg', 'rb')})
bids = Bid.create({status:"ok", category_id:8, active:true, user_id:2, date_from:DateTime.now, date_to:DateTime.now+5, name:"Ausbau Dachboden", address1:"Amriswil", address2:"Hauptstrasse", address3:"", description:"baue meinen Dachboden um. Ca. 80qm"})
biddetails = BidDetail.create({status:"ok", bid_id:2, name:"Bild 1", avatar:File.open(path+'dach.jpg', 'rb')})
biddetails = BidDetail.create({status:"ok", bid_id:2, name:"Bild 2", avatar:File.open(path+'dach1.jpg', 'rb')})
bids = Bid.create({status:"ok", category_id:24, active:true, user_id:4, date_from:DateTime.now, date_to:DateTime.now+4, name:"Catering für 50igsten Geburtstag", address1:"Lommis", address2:"Hauptstrasse", address3:"", description:"Zelt, Grill & Party für 150 Personen"})
biddetails = BidDetail.create({status:"ok", bid_id:3, name:"Bild 1", avatar:File.open(path+'zelt150.jpg', 'rb')})
biddetails = BidDetail.create({status:"ok", bid_id:3, name:"Bild 2", avatar:File.open(path+'grossgrill.jpg', 'rb')})
biddetails = BidDetail.create({status:"ok", bid_id:3, name:"Bild 3", avatar:File.open(path+'catering.jpg', 'rb')})

#create some events..
events = Event.create({ev_category_id:1, status:"ok", active:true, user_id:nil, company_id:1, date_from:DateTime.now, date_to:DateTime.now+30, name:"Einweihung neue Frischetheke", address1:"Lommis", address2:"", address3:"", description:"Neue Theke 100m"})
eventdetails = EventDetail.create({status:"ok", event_id:1, name:"Bild 1", avatar:File.open(path+'superfisch.jpg', 'rb')})
eventdetails = EventDetail.create({status:"ok", event_id:1, name:"Bild 2", avatar:File.open(path+'tigerprawns.jpg', 'rb')})
events = Event.create({ev_category_id:2, status:"ok", active:true, user_id:1, company_id:nil, date_from:DateTime.now, date_to:DateTime.now+20, name:"Grümpelturnier Münsterlingen", address1:"Münsterlingen", address2:"Sportheim", address3:"", description:"Grümpelturnier"})
eventdetails = EventDetail.create({status:"ok", event_id:2, name:"Bild 1", avatar:File.open(path+'spielbetrieb.jpg', 'rb')})
eventdetails = EventDetail.create({status:"ok", event_id:2, name:"Bild 2", avatar:File.open(path+'abendunterhaltung.jpg', 'rb')})
events = Event.create({ev_category_id:1, status:"ok", active:true, user_id:1, company_id:nil, date_from:DateTime.now, date_to:DateTime.now+10, name:"Bandabend Affeltrangen", address1:"Affeltrangen", address2:"Turnhalle", address3:"", description:"Grümpelturnier"})
eventdetails = EventDetail.create({status:"ok", event_id:3, name:"Bild 1", avatar:File.open(path+'band1.jpg', 'rb')})
eventdetails = EventDetail.create({status:"ok", event_id:3, name:"Bild 2", avatar:File.open(path+'band2.jpg', 'rb')})
eventdetails = EventDetail.create({status:"ok", event_id:3, name:"Bild 2", avatar:File.open(path+'band3.jpg', 'rb')})

#create some hotspots..
hotspots = Hotspot.create({hs_category_id:5, status:"ok", active:true, user_id:2, name:"Eselfest Affeltrangen", address1:"Affeltrangen", address2:"Dorfstrasse 12", address3:"", description:""})
hsdetails = HotspotDetail.create({status:"ok", hotspot_id:1, name:"Bild 1", avatar:File.open(path+'eselfest.jpg', 'rb')})
hsdetails = HotspotDetail.create({status:"ok", hotspot_id:1, name:"Bild 2", avatar:File.open(path+'esel1.jpg', 'rb')})
hsdetails = HotspotDetail.create({status:"ok", hotspot_id:1, name:"Bild 3", avatar:File.open(path+'esel2.jpg', 'rb')})
hsdetails = HotspotDetail.create({status:"ok", hotspot_id:1, name:"Bild 4", avatar:File.open(path+'esel3.jpg', 'rb')})
hsrats = HsRating.create({status:"ok", hotspot_id:1, user_id:4, user_rating:4, user_comment:"besser geht's nicht" })
hsrats = HsRating.create({status:"ok", hotspot_id:1, user_id:3, user_rating:1, user_comment:"Zeitverschwendung" })
hsrats = HsRating.create({status:"ok", hotspot_id:1, user_id:5, user_rating:4, user_comment:"ideal auch für Kinder" })
hsrats = HsRating.create({status:"ok", hotspot_id:1, user_id:6, user_rating:5, user_comment:"Super Ausflugsziel" })
hsrats = HsRating.create({status:"ok", hotspot_id:1, user_id:7, user_rating:3, user_comment:"besser als zu Hause rumsitzen" })
hsrats = HsRating.create({status:"ok", hotspot_id:1, user_id:8, user_rating:5, user_comment:"besser geht's nicht" })

hotspots = Hotspot.create({hs_category_id:3, status:"ok", active:true, user_id:2, name:"Kartause Ittingen", address1:"Ittingen", address2:"", address3:"", description:""})
hsdetails = HotspotDetail.create({status:"ok", hotspot_id:2, name:"Bild 1", avatar:File.open(path+'ittingen.jpg', 'rb')})
hsrats = HsRating.create({status:"ok", hotspot_id:2, user_id:1, user_rating:5, user_comment:"Super Ausflugsziel" })
hsrats = HsRating.create({status:"ok", hotspot_id:2, user_id:7, user_rating:3, user_comment:"besser als zu Hause rumsitzen" })
hsrats = HsRating.create({status:"ok", hotspot_id:2, user_id:8, user_rating:5, user_comment:"besser geht's nicht" })

hotspots = Hotspot.create({hs_category_id:3, status:"ok", active:true, user_id:2, name:"Schloss Weinfelden", address1:"Weinfelden", address2:"", address3:"", description:""})
hsdetails = HotspotDetail.create({status:"ok", hotspot_id:3, name:"Bild 1", avatar:File.open(path+'weinfelden.jpg', 'rb')})
hsrats = HsRating.create({status:"ok", hotspot_id:3, user_id:2, user_rating:4, user_comment:"besser geht's nicht" })
hsrats = HsRating.create({status:"ok", hotspot_id:3, user_id:3, user_rating:1, user_comment:"Zeitverschwendung" })
hsrats = HsRating.create({status:"ok", hotspot_id:3, user_id:4, user_rating:4, user_comment:"ideal auch für Kinder" })

#create some Donation Initiatives..
donations = Donation.create({date_from:Date.today, date_to:Date.today+30, dtype:"Donation", status:"ok", active:true, company_id:9, amount:5000, name:"Initiative Winterquartier für Igel", stichworte:"Igel Winterquartier Tierschutz", description:""})
ddetails = DonationDetail.create({status:"ok", donation_id:1, name:"Bild 1", avatar:File.open(path+'igel1.jpg', 'rb')})
ddetails = DonationDetail.create({status:"ok", donation_id:1, name:"Bild 2", avatar:File.open(path+'igel2.jpg', 'rb')})
ddetails = DonationDetail.create({status:"ok", donation_id:1, name:"Bild 3", avatar:File.open(path+'igel3.jpg', 'rb')})
ddetails = DonationDetail.create({status:"ok", donation_id:1, name:"Bild 4", avatar:File.open(path+'igel4.jpg', 'rb')})
dstats = DonationStat.create({status:"ok", donation_id:1, user_id:1, company_id:nil, amount:500 })
dstats = DonationStat.create({status:"ok", donation_id:1, user_id:3, company_id:nil, amount:150 })
dstats = DonationStat.create({status:"ok", donation_id:1, user_id:6, company_id:nil, amount:250 })
dstats = DonationStat.create({status:"ok", donation_id:1, user_id:nil, company_id:4, amount:1000 })
donations = Donation.create({date_from:Date.today, date_to:Date.today+60, dtype:"Donation", status:"ok", active:true, company_id:10, amount:10000, name:"Blindenhunde", stichworte:"Igel Winterquartier Tierschutz", description:""})
ddetails = DonationDetail.create({status:"ok", donation_id:2, name:"Bild 1", avatar:File.open(path+'blindenhunde1.jpg', 'rb')})
ddetails = DonationDetail.create({status:"ok", donation_id:2, name:"Bild 2", avatar:File.open(path+'blindenhunde2.jpg', 'rb')})
dstats = DonationStat.create({status:"ok", donation_id:2, user_id:4, company_id:nil, amount:500 })
dstats = DonationStat.create({status:"ok", donation_id:2, user_id:5, company_id:nil, amount:150 })
dstats = DonationStat.create({status:"ok", donation_id:2, user_id:nil, company_id:6, amount:1250 })
dstats = DonationStat.create({status:"ok", donation_id:2, user_id:nil, company_id:4, amount:1000 })

donations = Donation.create({date_from:Date.today, date_to:Date.today+30, dtype:"Reward", status:"ok", active:true, company_id:9, amount:5000, name:"Maler Atelier einrichten", stichworte:"Malerei Bilder Gemälde", price:250, description:""})
ddetails = DonationDetail.create({status:"ok", donation_id:3, name:"Bild 1", avatar:File.open(path+'atelier1.jpg', 'rb')})
ddetails = DonationDetail.create({status:"ok", donation_id:3, name:"Bild 2", avatar:File.open(path+'atelier2.jpg', 'rb')})
dstats = DonationStat.create({status:"ok", donation_id:3, user_id:1, company_id:nil, amount:250 })
dstats = DonationStat.create({status:"ok", donation_id:3, user_id:3, company_id:nil, amount:250 })
dstats = DonationStat.create({status:"ok", donation_id:3, user_id:6, company_id:nil, amount:250 })
dstats = DonationStat.create({status:"ok", donation_id:3, user_id:nil, company_id:4, amount:250 })
donations = Donation.create({date_from:Date.today, date_to:Date.today+90, dtype:"Reward", status:"ok", active:true, user_id:10, amount:12000, name:"Neue R&B CD mit meiner Band", stichworte:"CD Band Musik", price:50, description:""})
ddetails = DonationDetail.create({status:"ok", donation_id:4, name:"Trackbeschreibung", avatar:File.open(path+'cd1.jpg', 'rb')})
ddetails = DonationDetail.create({status:"ok", donation_id:4, name:"Rewardbeschreibung", avatar:File.open(path+'cd2.jpg', 'rb')})
ddetails = DonationDetail.create({status:"ok", donation_id:4, name:"und das sind wir...", avatar:File.open(path+'cd3.jpg', 'rb')})
dstats = DonationStat.create({status:"ok", donation_id:4, user_id:4, company_id:nil, amount:50 })
dstats = DonationStat.create({status:"ok", donation_id:4, user_id:5, company_id:nil, amount:50 })
dstats = DonationStat.create({status:"ok", donation_id:4, user_id:nil, company_id:6, amount:50 })
dstats = DonationStat.create({status:"ok", donation_id:4, user_id:nil, company_id:4, amount:50 })
donations = Donation.create({date_from:Date.today, date_to:Date.today+90, dtype:"Reward", status:"ok", active:true, user_id:10, amount:12000, name:"Neue Kulissen für unser Theaterstück die Maus", stichworte:"Theater Kulissen", price:100, description:""})
ddetails = DonationDetail.create({status:"ok", donation_id:5, name:"wir", avatar:File.open(path+'theater1.jpg', 'rb')})
ddetails = DonationDetail.create({status:"ok", donation_id:5, name:"Kulissen1", avatar:File.open(path+'theater2.jpg', 'rb')})
ddetails = DonationDetail.create({status:"ok", donation_id:5, name:"Kulissen2...", avatar:File.open(path+'theater3.jpg', 'rb')})
dstats = DonationStat.create({status:"ok", donation_id:5, user_id:14, company_id:nil, amount:50 })
dstats = DonationStat.create({status:"ok", donation_id:5, user_id:12, company_id:nil, amount:50 })
dstats = DonationStat.create({status:"ok", donation_id:5, user_id:nil, company_id:3, amount:50 })
dstats = DonationStat.create({status:"ok", donation_id:5, user_id:nil, company_id:2, amount:50 })
donations = Donation.create({date_from:Date.today, date_to:Date.today+90, dtype:"Loan", status:"ok", active:true, user_id:10, amount:5000, interest_rate:3.5, due_date:Date.today+200, name:"Neue Kaffeemaschine für unser Bäsabeiz", stichworte:"Kaffee Bäsabeiz", price:100, description:""})
ddetails = DonationDetail.create({status:"ok", donation_id:6, name:"Kaffeemaschine professionell", avatar:File.open(path+'kaffeemaschine.jpg', 'rb')})
dstats = DonationStat.create({status:"ok", donation_id:6, user_id:14, company_id:nil, amount:500 })
dstats = DonationStat.create({status:"ok", donation_id:6, user_id:12, company_id:nil, amount:500 })
dstats = DonationStat.create({status:"ok", donation_id:6, user_id:nil, company_id:3, amount:1000 })
dstats = DonationStat.create({status:"ok", donation_id:6, user_id:nil, company_id:2, amount:2500 })

#create some Jobs..
jobs = Job.create({status:"ok", active:true, company_id:2, name:"LKW Fahrer", stichworte:"LKW KFZ Entsorgung"})
jobs = Job.create({status:"ok", active:true, company_id:1, name:"Fischverkäufer/IN", stichworte:"LKW KFZ Entsorgung"})
jobs = Job.create({status:"ok", active:true, company_id:3, name:"Elektro Schweisser", stichworte:"Metall"})
jobs = Job.create({status:"ok", active:true, company_id:4, name:"Kundenberater (Vorsorgen)", stichworte:"Bank Finanz"})
jobs = Job.create({status:"ok", active:true, company_id:4, name:"Kundenberater (Finanzieren)", stichworte:"Bank Finanz"})
jobs = Job.create({status:"ok", active:true, company_id:4, name:"Kundenberater (Anlegen)", stichworte:"Bank Finanz"})

#create some kleinanzeigen..
requests = Request.create({status:"ok", active:true, user_id:1, rtype:"suche", price: 75.00, name:"Aquarium", social:false, date_from:Date.today, date_to:Date.today+10})
rds = RequestDetail.create({status:"ok", request_id:1, name:"Bild 1", avatar:File.open(path+'aquarium1.jpg', 'rb')})
rds = RequestDetail.create({status:"ok", request_id:1, name:"Bild 1", avatar:File.open(path+'aquarium2.jpg', 'rb')})
rds = RequestDetail.create({status:"ok", request_id:1, name:"Bild 1", avatar:File.open(path+'aquarium3.jpg', 'rb')})

requests = Request.create({status:"ok", active:true, user_id:2, rtype:"suche", price: 20.00, name:"Nachhilfe in Mathe", social:false, date_from:Date.today, date_to:Date.today+10})
rds = RequestDetail.create({status:"ok", request_id:2, name:"Bild 1", avatar:File.open(path+'mathe1.jpg', 'rb')})

requests = Request.create({status:"ok", active:true, user_id:2, rtype:"suche", price: 15.00, name:"Tennisunterricht", social:false, date_from:Date.today, date_to:Date.today+10})
rds = RequestDetail.create({status:"ok", request_id:3, name:"Bild 1", avatar:File.open(path+'tennis.jpg', 'rb')})

requests = Request.create({status:"ok", active:true, user_id:3, rtype:"suche", price: 0.00, name:"Schachpartner", social:true, date_from:Date.today, date_to:Date.today+10})
rds = RequestDetail.create({status:"ok", request_id:4, name:"Bild 1", avatar:File.open(path+'schach1.jpg', 'rb')})

requests = Request.create({status:"ok", active:true, user_id:4, rtype:"suche", price: 50000.00, name:"Oldtimer", social:false, date_from:Date.today, date_to:Date.today+10})
rds = RequestDetail.create({status:"ok", request_id:5, name:"Bild 1", avatar:File.open(path+'fiat1.jpg', 'rb')})
rds = RequestDetail.create({status:"ok", request_id:5, name:"Bild 1", avatar:File.open(path+'fiat2.jpg', 'rb')})
rds = RequestDetail.create({status:"ok", request_id:5, name:"Bild 1", avatar:File.open(path+'fiat3.jpg', 'rb')})

requests = Request.create({status:"ok", active:true, user_id:4, rtype:"biete", price: 5000.00, name:"Alte Briefmarken", social:false, date_from:Date.today, date_to:Date.today+10})
rds = RequestDetail.create({status:"ok", request_id:6, name:"Bild 1", avatar:File.open(path+'stamp1.jpg', 'rb')})
rds = RequestDetail.create({status:"ok", request_id:6, name:"Bild 1", avatar:File.open(path+'stamp2.jpg', 'rb')})
rds = RequestDetail.create({status:"ok", request_id:6, name:"Bild 1", avatar:File.open(path+'stamp3.jpg', 'rb')})
rds = RequestDetail.create({status:"ok", request_id:6, name:"Bild 1", avatar:File.open(path+'stamp4.jpg', 'rb')})

requests = Request.create({status:"ok", active:true, user_id:5, rtype:"suche", price: 1500.00, name:"Gartenlounge in gutem Zustand", social:false, date_from:Date.today, date_to:Date.today+10})
requests = Request.create({status:"ok", active:true, user_id:1, rtype:"suche", price: 150.00, name:"gebrauchten Computer bis max 100 CHF", social:false, date_from:Date.today, date_to:Date.today+10})

requests = Request.create({status:"ok", active:true, user_id:6, rtype:"biete", price: 25.00, name:"Meerschweichen Käfig", social:false, date_from:Date.today, date_to:Date.today+10})
rds = RequestDetail.create({status:"ok", request_id:9, name:"Bild 1", avatar:File.open(path+'kaefig1.jpg', 'rb')})
rds = RequestDetail.create({status:"ok", request_id:9, name:"Bild 2", avatar:File.open(path+'kaefig2.jpg', 'rb')})

requests = Request.create({status:"ok", active:true, user_id:3, rtype:"biete", price: 750.00, name:"Mountainbike", social:false, date_from:Date.today, date_to:Date.today+10})
rds = RequestDetail.create({status:"ok", request_id:10, name:"Bild 1", avatar:File.open(path+'bike1.jpg', 'rb')})
rds = RequestDetail.create({status:"ok", request_id:10, name:"Bild 2", avatar:File.open(path+'bike2.jpg', 'rb')})

requests = Request.create({status:"ok", active:true, user_id:2, rtype:"biete", price: 150.00, name:"Carver Ski", social:false, date_from:Date.today, date_to:Date.today+10})
rds = RequestDetail.create({status:"ok", request_id:11, name:"Bild 1", avatar:File.open(path+'ski1.jpg', 'rb')})

requests = Request.create({status:"ok", active:true, user_id:1, rtype:"biete", price: 150.00, name:"Spanisch Lehrbücher", social:false, date_from:Date.today, date_to:Date.today+10})
rds = RequestDetail.create({status:"ok", request_id:12, name:"Bild 1", avatar:File.open(path+'spanisch1.jpg', 'rb')})
rds = RequestDetail.create({status:"ok", request_id:12, name:"Bild 2", avatar:File.open(path+'spanisch2.jpg', 'rb')})
rds = RequestDetail.create({status:"ok", request_id:12, name:"Bild 3", avatar:File.open(path+'spanisch3.jpg', 'rb')})
rds = RequestDetail.create({status:"ok", request_id:12, name:"Bild 4", avatar:File.open(path+'spanisch4.jpg', 'rb')})

requests = Request.create({status:"ok", active:true, user_id:1, rtype:"biete", price: 20.00, name:"Nachhilfe in Englisch", social:false, date_from:Date.today, date_to:Date.today+10})
rds = RequestDetail.create({status:"ok", request_id:13, name:"Bild 1", avatar:File.open(path+'englisch1.jpg', 'rb')})
rds = RequestDetail.create({status:"ok", request_id:13, name:"Bild 2", avatar:File.open(path+'englisch2.jpg', 'rb')})

requests = Request.create({status:"ok", active:true, user_id:1, rtype:"biete", price: 200.00, name:"Commodore VC 20 nur für Liebhaber", social:false, date_from:Date.today, date_to:Date.today+10})
rds = RequestDetail.create({status:"ok", request_id:14, name:"Bild 1", avatar:File.open(path+'computer1.jpg', 'rb')})
rds = RequestDetail.create({status:"ok", request_id:14, name:"Bild 2", avatar:File.open(path+'computer2.jpg', 'rb')})
rds = RequestDetail.create({status:"ok", request_id:14, name:"Bild 3", avatar:File.open(path+'computer3.jpg', 'rb')})
