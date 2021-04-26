editor = Employee.create!(first_name: "roy", last_name: "mosby", title: "chief editor", password: "password")

journalist = Employee.create!(first_name: "larry", last_name: "croix", title: "journalist at large", password: "password")

Article.create!(title: "This one's a floater")

Article.create!(title: "this one is assigned", employee_id: journalist.id)

reviewed = Article.create!(title: "this one is assigned and has a review", employee_id: journalist.id)

EditorRevision.create!(content: "Please update article title per meeting", reviewer_id: editor.id, article_id: reviewed.id)

roles = ["create", "approve", "assign", "edit", "review", "publish"]

#TODO roles need to be pre-populated into production database
roles.each { |r| Role.create!(role: r)}
