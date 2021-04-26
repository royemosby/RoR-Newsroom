#users

editor = Employee.create!(first_name: "roy", last_name: "mosby", title: "chief editor", password: "password")
journalist = Employee.create!(first_name: "samantha", last_name: "croix", title: "journalist at large", password: "password")
intern = Employee.create!(first_name: "larry", last_name: "grotch", title: "newsroom intern", password: "password")

#articles

Article.create!(title: "This one's a floater", content: Faker::Lorem.paragraphs(number: 3).join)
Article.create!(title: "this one is assigned", employee_id: journalist.id, content: Faker::Lorem.paragraphs(number: 3).join)

#editor review

reviewed = Article.create!(title: "this one is assigned and has a review", employee_id: journalist.id)
EditorRevision.create!(content: "Please update article title per meeting", reviewer_id: editor.id, article_id: reviewed.id)

#article update

has_update = Article.create(title: "this one has an update", employee_id: journalist.id)
ArticleUpdate.create!(content: "Nostrum did not lorem that day.", article_id: has_update.id, updater_id: intern.id)


#roles
roles = ["create", "approve", "assign", "edit", "review", "publish"]

#TODO roles need to be pre-populated into production database
roles.each { |r| Role.create!(role: r)}

#tags