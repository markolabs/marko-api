# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# COLORS

ColorTheme.create([
  {name: "blue", background: "#96B5D8", text: "#082D6D"},
  {name: "red", background: "#FFB5C9", text: "#8F000D"},
  {name: "green", background: "#D3FDA5", text: "#3E7300"},
  {name: "orange", background: "#FDD882", text: "#8D5900"},
  {name: "purple", background: "#E1BAFF", text: "#280047"},
  {name: "yellow", background: "#FEF7A3", text: "#544F20"}
])