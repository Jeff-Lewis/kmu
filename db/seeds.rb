# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create({userid:"horst.wurm@bluewin.ch", password:"password", name:"Horst", lastname:"Wurm"})
users = User.create({userid:"t.oschewsky@bluewin.ch", password:"password", name:"Tanja", lastname:"Oschewsky"})
users = User.create({userid:"hans.wurst@gmx.com", password:"password", name:"Hans", lastname:"Wurst"})
users = User.create({userid:"anton.meier@outlook.com", password:"password", name:"Anton", lastname:"Meier"})

projects = Project.create({user_id:1, name:"Projekt 0815"})
projects = Project.create({user_id:2, name:"Projekt 4711"})

subprojects = Subproject.create({user_id:1, project_id:1, name:"Organisation"})
subprojects = Subproject.create({user_id:1, project_id:1, name:"IT"})
subprojects = Subproject.create({user_id:1, project_id:1, name:"Infrastruktur"})
subprojects = Subproject.create({user_id:1, project_id:1, name:"SW-Engineering"})
subprojects = Subproject.create({user_id:1, project_id:1, name:"Architektur"})
subprojects = Subproject.create({user_id:2, project_id:2, name:"Phase 1"})
subprojects = Subproject.create({user_id:2, project_id:2, name:"Phase 2"})
subprojects = Subproject.create({user_id:2, project_id:2, name:"Phase 3"})
subprojects = Subproject.create({user_id:2, project_id:2, name:"Phase 4"})
subprojects = Subproject.create({user_id:2, project_id:2, name:"Phase 5"})
subprojects = Subproject.create({user_id:2, project_id:2, name:"Phase 6"})

workorders = Workorder.create({user_id:1, subproject_id:1, name:"Task AAAA"})
workorders = Workorder.create({user_id:1, subproject_id:1, name:"Task BBBB"})
workorders = Workorder.create({user_id:1, subproject_id:1, name:"Task CCCC"})
workorders = Workorder.create({user_id:1, subproject_id:1, name:"Task DDDD"})
workorders = Workorder.create({user_id:2, subproject_id:6, name:"Task 11111"})
workorders = Workorder.create({user_id:2, subproject_id:6, name:"Task 22222"})
workorders = Workorder.create({user_id:2, subproject_id:6, name:"Task 33333"})
workorders = Workorder.create({user_id:2, subproject_id:6, name:"Task 44444"})
workorders = Workorder.create({user_id:1, subproject_id:1, name:"Task EEEEE"})

accesses = Access.create({user_id:1, workorder_id:1, costrate:120})
accesses = Access.create({user_id:1, workorder_id:5, costrate:145})

tt = Timetrack.create({user_id:1, workorder_id:1, tandm:"TIME", amount:2, active:true, datum:DateTime.now, activity:"Dies war ein anstrengender Tag..."})
tt = Timetrack.create({user_id:1, workorder_id:1, tandm:"TIME", amount:4, active:true, datum:DateTime.now, activity:"meine Herren..."})
tt = Timetrack.create({user_id:1, workorder_id:2, tandm:"TIME", amount:5, active:true, datum:DateTime.now, activity:"Tabellen pflegen macht keinen Spass..."})
tt = Timetrack.create({user_id:1, workorder_id:2, tandm:"TIME", amount:7, active:true, datum:DateTime.now, activity:"Soviele Stunden investiert für nichts..."})
tt = Timetrack.create({user_id:1, workorder_id:2, tandm:"TIME", amount:8, active:true, datum:DateTime.now, activity:"Dund noch eine notwendige Task..."})
