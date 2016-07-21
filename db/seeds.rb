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
appparams = Appparam.create({name:"Spenden", description:"Spenden von Privaten & Institutionen für Spendeninitiativen", active:true})
appparams = Appparam.create({name:"Bewertungen", description:"Bewertung von Produkten & Services von Institutionen & Privaten", active:true})
appparams = Appparam.create({name:"Privatpersonen", description:"Privatpersonen", active:true})
appparams = Appparam.create({name:"Favoriten", description:"Personen & Institutionen folgen", active:true})
appparams = Appparam.create({name:"Sehenswürdigkeiten", description:"Lohnenswerte Ausflugsziele in der Region", active:true})
appparams = Appparam.create({name:"Links", description:"Links der Partnerfirmen", active:true})

path = Rails.root.to_s + "/app/assets/images/sample_pics/"
#create some users...

users = User.create({dateofbirth:"12.12.2003", anonymous:false, status:"ok", active:true, email:"horst.wurm@bluewin.ch", password:"password", name:"Horst", lastname:"Wurm", address1:"Hörnliblick 11", address2:"Zezikon", address3:"", superuser:true, avatar:File.open(path+'ma_1.jpg', 'rb')})
users = User.create({dateofbirth:"1.7.2013", anonymous:false, status:"ok", active:true, email:"t.oschewsky@bluewin.ch", password:"password", name:"Tanja", lastname:"Oschewsky", address1:"Hörnliblick 11", address2:"Zezikon", address3:"", superuser:false,avatar:File.open(path+'ma_3.jpg', 'rb')})
users = User.create({dateofbirth:"12.12.2016", anonymous:false, status:"ok", active:true, email:"hans.wurst@gmx.com", password:"password", name:"Hans", lastname:"Wurst", address1:"Bahnhofstrasse 11", address2:"Frauenfeld", address3:"", superuser:false,avatar:File.open(path+'ma_2.jpg', 'rb')})
users = User.create({dateofbirth:"2.10.2005", anonymous:false, status:"ok", active:true, email:"anton.meier@outlook.com", password:"password", name:"Anton", lastname:"Meier", address1:"Im Roos", address2:"Weinfelden", address3:"", superuser:false,avatar:File.open(path+'ma_4.jpg', 'rb')})
users = User.create({dateofbirth:"12.9.2007", anonymous:false, status:"ok", active:true, email:"e.oschewsky@bluewin.ch", password:"password", name:"Emelie", lastname:"Oschewsky", address1:"Hörnliblick 11", address2:"Zezikon", address3:"", superuser:false,avatar:File.open(path+'ma_8.jpg', 'rb')})
users = User.create({dateofbirth:"11.5.1963", anonymous:false, status:"ok", active:true, email:"henning.gebert@outlook.com", password:"password", name:"Henning", lastname:"Gebert", address1:"Bahnhof", address2:"Pfäffikon SZ", address3:"", superuser:false,avatar:File.open(path+'ma_7.jpg', 'rb')})
users = User.create({dateofbirth:"1.5.1970", anonymous:false, status:"ok", active:true, email:"heidi.hirsch@outlook.ch", password:"password", name:"Heidi", lastname:"Hirsch", address1:"Hauptstrasse 1", address2:"Amlikon", address3:"", superuser:false, avatar:File.open(path+'ma_9.jpg', 'rb')})
users = User.create({dateofbirth:"14.4.2003", anonymous:false, status:"ok", active:true, email:"fred.gautschi@bluewin.ch", password:"password", name:"Fred", lastname:"Gautschi", address1:"Dorfplatz 1", address2:"Matzingen", address3:"", superuser:false,avatar:File.open(path+'ma_6.jpg', 'rb')})
users = User.create({dateofbirth:"6.3.2004", anonymous:false, status:"ok", active:true, email:"christian.meier@gmx.com", password:"password", name:"Christian", lastname:"Meier", address1:"Alte Wilderenstrasse 4", address2:"Zezikon", address3:"", superuser:false,avatar:File.open(path+'ma_2.jpg', 'rb')})
users = User.create({dateofbirth:"12.12.2008", anonymous:false, status:"ok", active:true, email:"barak@outlook.com", password:"password", name:"Barak", lastname:"Obama", address1:"Marktplatz", address2:"Frauenfeld", address3:"", superuser:false,avatar:File.open(path+'ma_10.jpg', 'rb')})
users = User.create({dateofbirth:"26.4.2009", anonymous:false, status:"ok", active:true, email:"trump@bluewin.ch", password:"password", name:"Donald", lastname:"Trump", address1:"Hauptstrasse 1", address2:"Buch", address3:"Thurgau", superuser:false,avatar:File.open(path+'ma_11.jpg', 'rb')})
users = User.create({dateofbirth:"12.7.2010", anonymous:false, status:"ok", active:true, email:"angela@outlook.com", password:"password", name:"Angela", lastname:"Merkel", address1:"Bahnhof", address2:"Wil SG", address3:"", superuser:false,avatar:File.open(path+'ma_12.jpg', 'rb')})

#create some companies...
companies = Company.create({status:"ok", active:true, user_id:1, name:"Fischzucht Hecht", category_id:24 ,stichworte: "Fische, Zierfische, Angelbedarf", address1:"Bahnhof", address2:"Frauenfeld", address3:"Thurgau", avatar:File.open(path+'fischhaendler.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:2, name:"Alder Entsorgung", category_id:11 ,stichworte: "Hocbau, Tiefbau", address1:"Bahnhof", address2:"Wil", address3:"Thurgau", avatar:File.open(path+'alder.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:3, name:"Eisenwaren Müller", category_id:12 ,stichworte: "Hocbau, Tiefbau", address1:"Thurgauer Str", address2:"Matzingen", address3:"Thurgau", avatar:File.open(path+'eisenmueller.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:4, name:"TKB", category_id:26 ,stichworte: "Banken", address1:"Bahnhof", address2:"Weinfelden", address3:"Thurgau", avatar:File.open(path+'tkb.png', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:5, name:"Prematic", category_id:12 ,stichworte: "Luftdruck", address1:"Bahnhof", address2:"Wängi", address3:"Thurgau", avatar:File.open(path+'prematic.png', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:6, name:"Baufirma Meier", category_id:11 ,stichworte: "Hocbau, Tiefbau", address1:"Hauptstrasse", address2:"Zezikon", address3:"Thurgau", avatar:File.open(path+'meier.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:1, name:"Lackierwerkstatt Manser", category_id:9 ,stichworte: "Karosserie", address1:"Amlikon", address2:"Haupstrasse", address3:"Thurgau", avatar:File.open(path+'mazda-mx-5-cabriolet-2006-occasion.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:2, name:"Malermeister Painter", category_id:10 ,stichworte: "Malerarbeiten", address1:"Gartenstrasse 2", address2:"Lommis", address3:"Thurgau", avatar:File.open(path+'maler.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:1, name:"Tierschutzbund Weinfelden", category_id:25 ,stichworte: "Tiere", address1:"Gartenstrasse 2", address2:"Lommis", address3:"Thurgau", social:true, avatar:File.open(path+'tierschutz.png', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:1, name:"Blindenverein Wängi", category_id:9 ,stichworte: "Verein", address1:"Wängi", address2:"Haupstrasse", address3:"Thurgau", avatar:File.open(path+'blindenverein.jpg', 'rb'), social:true}) 
companies = Company.create({status:"ok", active:true, user_id:2, name:"Kosmetikstudio Jasmine", category_id:10 ,stichworte: "Kosmetik", address1:"Gartenstrasse 2", address2:"Bürglen", address3:"Thurgau", avatar:File.open(path+'kosmetik.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:1, name:"Autohaus Hummel", category_id:25 ,stichworte: "Auto KFZ", address1:"Hauptstrasse", address2:"Bissegg", address3:"Thurgau", avatar:File.open(path+'autobissegg.png', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:1, name:"Valiant Bank", category_id:26 ,stichworte: "Bank Finanz Geld", address1:"Bahnhof", address2:"Bern", address3:"Bern", avatar:File.open(path+'valiant.png', 'rb')}) 

partnerlinks = PartnerLink.create({active:true, company_id:13, name:"eBanking", link:"www.valiant.ch/ebanking"})
partnerlinks = PartnerLink.create({active:true, company_id:13, name:"OnlineLimite", link:"www.valiant.ch/online"})

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
services = Service.create({status:"ok", active:true, company_id:5, parent_id:0, stype:"regular", name:"Maschinen Luftdruck", social:false, avatar:File.open(path+'luftdruck.jpg', 'rb')})

services = Service.create({status:"ok", active:true, company_id:1, parent_id:0, stype:"action", name:"Fischbuffet zum halben Preis", date_from:DateTime.now, date_to:DateTime.now, avatar:File.open(path+'fischbuffet.jpg', 'rb')})
services = Service.create({status:"ok", active:true, company_id:11, parent_id:0, stype:"action", name:"Gesichtsbehandlung 50% Rabatt", date_from:DateTime.now, date_to:DateTime.now, avatar:File.open(path+'gesicht.jpg', 'rb')})
rats = Rating.create({status:"ok", service_id:12, user_id:1, user_rating:4, user_comment:"Wahnsinn für den Preis" })
rats = Rating.create({status:"ok", service_id:12, user_id:2, user_rating:5, user_comment:"absolut Super" })
rats = Rating.create({status:"ok", service_id:12, user_id:4, user_rating:5, user_comment:"absolut empfehlenswert" })
rats = Rating.create({status:"ok", service_id:12, user_id:5, user_rating:4, user_comment:"genialer Service" })
rats = Rating.create({status:"ok", service_id:12, user_id:6, user_rating:5, user_comment:"prima immer wieder" })
rats = Rating.create({status:"ok", service_id:12, user_id:8, user_rating:6, user_comment:"total empfehlenswert" })

services = Service.create({status:"ok", active:true, company_id:12, parent_id:0, stype:"action", name:"Superrabatt Golf!!!", date_from:DateTime.now, date_to:DateTime.now, avatar:File.open(path+'vwgolf.jpg', 'rb')})
rats = Rating.create({status:"ok", service_id:13, user_id:1, user_rating:1, user_comment:"Lockangebot - Fahrzeug gibt es gar nicht" })
rats = Rating.create({status:"ok", service_id:13, user_id:2, user_rating:2, user_comment:"Fahrzeug war dann plötzlich verkauft" })
rats = Rating.create({status:"ok", service_id:13, user_id:7, user_rating:1, user_comment:"Fahrzeuig konnte nicht bsichtigt werden und man wollte uns einen anderen viel teueren Wagen andrehen" })

#create some user services..
services = Service.create({status:"ok", active:true, user_id:1, parent_id:0, stype:"regular", name:"Altenpflege", avatar:File.open(path+'altenpflege.jpg', 'rb'), social:true})
rats = Rating.create({status:"ok", service_id:14, user_id:1, user_rating:5, user_comment:"echter good citizend " })
rats = Rating.create({status:"ok", service_id:14, user_id:2, user_rating:5, user_comment:"wunderbares ehrenamtliches Engagement" })

services = Service.create({status:"ok", active:true, user_id:1, parent_id:0, stype:"regular", name:"Gitarrenunterricht", avatar:File.open(path+'gitarrenunterricht.jpg', 'rb'), social:false})
rats = Rating.create({status:"ok", service_id:15, user_id:1, user_rating:5, user_comment:"cooler Unterricht - nie langweilig" })
rats = Rating.create({status:"ok", service_id:15, user_id:2, user_rating:5, user_comment:"kurzweilig und spannend" })

services = Service.create({status:"ok", active:true, user_id:2, parent_id:0, stype:"regular", name:"Mathe Nachhilfe", avatar:File.open(path+'mathe.jpg', 'rb'), social:true})
rats = Rating.create({status:"ok", service_id:16, user_id:5, user_rating:2, user_comment:"vielleicht kann man Mathe nicht besser unterrichten" })
rats = Rating.create({status:"ok", service_id:16, user_id:6, user_rating:3, user_comment:"naja auf alle Fälle besser als bei meinem Lehrer" })

services = Service.create({status:"ok", active:true, user_id:2, parent_id:0, stype:"regular", name:"Spanisch Unterricht", avatar:File.open(path+'spanisch.jpg', 'rb'), social:false})
rats = Rating.create({status:"ok", service_id:17, user_id:7, user_rating:5, user_comment:"mui bien" })
rats = Rating.create({status:"ok", service_id:17, user_id:8, user_rating:4, user_comment:"perfecto" })

services = Service.create({status:"ok", active:true, user_id:2, parent_id:0, stype:"regular", name:"Englisch Unterricht", avatar:File.open(path+'english.png', 'rb'), social:false})
services = Service.create({status:"ok", active:true, user_id:3, parent_id:0, stype:"regular", name:"Gartenarbeit", avatar:File.open(path+'gartenarbeit.jpg', 'rb'), social:false})
services = Service.create({status:"ok", active:true, user_id:4, parent_id:0, stype:"regular", name:"Einkaufen", avatar:File.open(path+'shopping.jpg', 'rb'), social:true})
rats = Rating.create({status:"ok", service_id:21, user_id:7, user_rating:5, user_comment:"immer freundlich und zuvorkommend" })
rats = Rating.create({status:"ok", service_id:21, user_id:8, user_rating:4, user_comment:"besser geht es nicht" })

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
bids = Bid.create({status:"ok", category_id:24, active:true, user_id:4, date_from:DateTime.now, date_to:DateTime.now+1, name:"Catering für 50igsten Geburtstag", address1:"Lommis", address2:"Hauptstrasse", address3:"", description:"Zelt, Grill & Party für 150 Personen"})
biddetails = BidDetail.create({status:"ok", bid_id:3, name:"Bild 1", avatar:File.open(path+'zelt150.jpg', 'rb')})
biddetails = BidDetail.create({status:"ok", bid_id:3, name:"Bild 2", avatar:File.open(path+'grossgrill.jpg', 'rb')})
biddetails = BidDetail.create({status:"ok", bid_id:3, name:"Bild 3", avatar:File.open(path+'catering.jpg', 'rb')})

#create some events..
events = Event.create({ev_category_id:1, status:"ok", active:true, user_id:nil, company_id:1, date_from:DateTime.now, date_to:DateTime.now+30, name:"Einweihung neue Frischetheke", address1:"Lommis", address2:"", address3:"", description:"Neue Theke 100m"})
eventdetails = EventDetail.create({status:"ok", event_id:1, name:"Bild 1", avatar:File.open(path+'superfisch.jpg', 'rb')})
eventdetails = EventDetail.create({status:"ok", event_id:1, name:"Bild 2", avatar:File.open(path+'tigerprawns.jpg', 'rb')})
events = Event.create({ev_category_id:2, status:"ok", active:true, user_id:1, company_id:nil, date_from:DateTime.now, date_to:DateTime.now+30, name:"Grümpelturnier Münsterlingen", address1:"Münsterlingen", address2:"Sportheim", address3:"", description:"Grümpelturnier"})
eventdetails = EventDetail.create({status:"ok", event_id:2, name:"Bild 1", avatar:File.open(path+'spielbetrieb.jpg', 'rb')})
eventdetails = EventDetail.create({status:"ok", event_id:2, name:"Bild 2", avatar:File.open(path+'abendunterhaltung.jpg', 'rb')})
events = Event.create({ev_category_id:1, status:"ok", active:true, user_id:1, company_id:nil, date_from:DateTime.now, date_to:DateTime.now+30, name:"Bandabend Affeltrangen", address1:"Affeltrangen", address2:"Turnhalle", address3:"", description:"Grümpelturnier"})
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
donations = Donation.create({status:"ok", active:true, company_id:9, amount:5000, name:"Initiative Winterquartier für Igel", stichworte:"Igel Winterquartier Tierschutz", description:""})
ddetails = DonationDetail.create({status:"ok", donation_id:1, name:"Bild 1", avatar:File.open(path+'igel1.jpg', 'rb')})
ddetails = DonationDetail.create({status:"ok", donation_id:1, name:"Bild 2", avatar:File.open(path+'igel2.jpg', 'rb')})
ddetails = DonationDetail.create({status:"ok", donation_id:1, name:"Bild 3", avatar:File.open(path+'igel3.jpg', 'rb')})
ddetails = DonationDetail.create({status:"ok", donation_id:1, name:"Bild 4", avatar:File.open(path+'igel4.jpg', 'rb')})
dstats = DonationStat.create({status:"ok", donation_id:1, user_id:1, company_id:nil, amount:500 })
dstats = DonationStat.create({status:"ok", donation_id:1, user_id:3, company_id:nil, amount:150 })
dstats = DonationStat.create({status:"ok", donation_id:1, user_id:6, company_id:nil, amount:250 })
dstats = DonationStat.create({status:"ok", donation_id:1, user_id:nil, company_id:4, amount:1000 })
donations = Donation.create({status:"ok", active:true, company_id:10, amount:10000, name:"Blindenhunde", stichworte:"Igel Winterquartier Tierschutz", description:""})
ddetails = DonationDetail.create({status:"ok", donation_id:2, name:"Bild 1", avatar:File.open(path+'blindenhunde1.jpg', 'rb')})
ddetails = DonationDetail.create({status:"ok", donation_id:2, name:"Bild 2", avatar:File.open(path+'blindenhunde2.jpg', 'rb')})
dstats = DonationStat.create({status:"ok", donation_id:2, user_id:4, company_id:nil, amount:500 })
dstats = DonationStat.create({status:"ok", donation_id:2, user_id:5, company_id:nil, amount:150 })
dstats = DonationStat.create({status:"ok", donation_id:2, user_id:nil, company_id:6, amount:1250 })
dstats = DonationStat.create({status:"ok", donation_id:2, user_id:nil, company_id:4, amount:1000 })

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
