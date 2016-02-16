# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#create some users...
users = User.create({userid:"horst.wurm@bluewin.ch", password:"password", name:"Horst", lastname:"Wurm", superuser:true})
users = User.create({userid:"t.oschewsky@bluewin.ch", password:"password", name:"Tanja", lastname:"Oschewsky", superuser:false})
users = User.create({userid:"hans.wurst@gmx.com", password:"password", name:"Hans", lastname:"Wurst", superuser:false})
users = User.create({userid:"anton.meier@outlook.com", password:"password", name:"Anton", lastname:"Meier", superuser:false})
users = User.create({userid:"e.oschewsky@bluewin.ch", password:"password", name:"Emelie", lastname:"Oschwesky", superuser:false})
users = User.create({userid:"henning.gebert@outlook.com", password:"password", name:"Henning", lastname:"Gebert", superuser:false})

#create workorders hierachy...
# workorders = Workorder.create({user_id:1, parent_id:0, name:"Project 4711", description:"this is a it project 4711"})
# workorders = Workorder.create({user_id:2, parent_id:0, name:"Project 0815", description:"this is a it project 4711"})
# workorders = Workorder.create({user_id:3, parent_id:0, name:"Projekt 0909090909", description:"this is a it project 4711"})
# workorders = Workorder.create({user_id:4, parent_id:0, name:"Initiative Trcik 17", description:"this is a it project 4711"})

    # workorders = Workorder.create({user_id:1, parent_id:1, name:"Organisation", description:"this is subproject organization"})
    #     workorders = Workorder.create({user_id:1, parent_id:2, name:"Process definitions", description:"these are the descriptions of the processes A..B"})
    #     workorders = Workorder.create({user_id:1, parent_id:2, name:"Org Hierachy definitions", description:"this is the organization"})
    #     workorders = Workorder.create({user_id:1, parent_id:2, name:"Workorders" , description:"define all workorders"})
    # workorders = Workorder.create({user_id:1, parent_id:1, name:"IT", description:"these are the IT Tasks"})
    #     workorders = Workorder.create({user_id:1, parent_id:6, name:"Specification", description:"define the specs of.."})
    #     workorders = Workorder.create({user_id:1, parent_id:6, name:"Implementation", description:"SW-Engineering..."})
    #     workorders = Workorder.create({user_id:1, parent_id:6, name:"Customizing" , description:"define all parameters..."})
    #     workorders = Workorder.create({user_id:1, parent_id:6, name:"Customizing" , description:"define all parameters..."})
        
# workorders = Workorder.create({user_id:2, parent_id:0, name:"Project Move", description:"moving to..."})
#     workorders = Workorder.create({user_id:1, parent_id:11, name:"Location Rosenberg", description:"location organization"})
#         workorders = Workorder.create({user_id:1, parent_id:12, name:"room 089899", description:"office space"})
#         workorders = Workorder.create({user_id:2, parent_id:12, name:"Oroom ABC", description:"stock"})
#     workorders = Workorder.create({user_id:1, parent_id:11, name:"Location Pfingstweidstrasse" , description:"location IT"})
#         workorders = Workorder.create({user_id:4, parent_id:16, name:"room 9191919", description:"define the specs of.."})

#create access for some users...
# accesses = Access.create({user_id:1, workorder_id:1, costrate:120})
# accesses = Access.create({user_id:1, workorder_id:2, costrate:120})
# accesses = Access.create({user_id:1, workorder_id:3, costrate:145})
# accesses = Access.create({user_id:1, workorder_id:5, costrate:145})
# accesses = Access.create({user_id:1, workorder_id:6, costrate:145})
# accesses = Access.create({user_id:2, workorder_id:5, costrate:145})
# accesses = Access.create({user_id:2, workorder_id:6, costrate:145})
# accesses = Access.create({user_id:2, workorder_id:7, costrate:145})
# accesses = Access.create({user_id:3, workorder_id:2, costrate:145})
# accesses = Access.create({user_id:3, workorder_id:6, costrate:145})
# accesses = Access.create({user_id:4, workorder_id:7, costrate:145})

# #create activities for some users...
# tt = Timetrack.create({user_id:1, workorder_id:1, tandm:"TIME", amount:2, active:true, datum:DateTime.now, activity:"Dies war ein anstrengender Tag..."})
# tt = Timetrack.create({user_id:1, workorder_id:1, tandm:"TIME", amount:4, active:true, datum:DateTime.now, activity:"meine Herren..."})
# tt = Timetrack.create({user_id:1, workorder_id:2, tandm:"TIME", amount:5, active:true, datum:DateTime.now, activity:"Tabellen pflegen macht keinen Spass..."})
# tt = Timetrack.create({user_id:1, workorder_id:3, tandm:"TIME", amount:7, active:true, datum:DateTime.now, activity:"Soviele Stunden investiert für nichts..."})
# tt = Timetrack.create({user_id:2, workorder_id:5, tandm:"TIME", amount:8, active:true, datum:DateTime.now, activity:"Dund noch eine notwendige Task..."})
# tt = Timetrack.create({user_id:2, workorder_id:5, tandm:"TIME", amount:2, active:true, datum:DateTime.now, activity:"Dies war ein anstrengender Tag..."})
# tt = Timetrack.create({user_id:2, workorder_id:6, tandm:"TIME", amount:4, active:true, datum:DateTime.now, activity:"meine Herren..."})
# tt = Timetrack.create({user_id:2, workorder_id:7, tandm:"TIME", amount:5, active:true, datum:DateTime.now, activity:"Tabellen pflegen macht keinen Spass..."})
# tt = Timetrack.create({user_id:3, workorder_id:6, tandm:"TIME", amount:7, active:true, datum:DateTime.now, activity:"Soviele Stunden investiert für nichts..."})
# tt = Timetrack.create({user_id:4, workorder_id:7, tandm:"TIME", amount:8, active:true, datum:DateTime.now, activity:"Dund noch eine notwendige Task..."})
