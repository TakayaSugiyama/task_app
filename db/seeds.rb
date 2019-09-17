user = User.create(name: "リラックマ", email: "relax@gmail.com", password: "relaxbear", admin: true)
user = User.create(name: "コリラックマ", email: "koribear@gmail.com", password: "koribear", admin: false)
#user = User.create(name: "キイロイトリ", email: "kiiroitori@gmail.com", password: "kiiroitori")

Label.create([
  {name: "プライベート"},
  {name: "仕事"}, 
  {name: "買い物" },
  {name: "勉強"},
  {name: "雑事"}, 
  {name: "遊び"}
])