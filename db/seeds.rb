#employees
sr_editor = Employee.create!(username: "d_smith", first_name: "deborah", last_name: "smith", title: "Senior Editor", password: "password")
editor = Employee.create!(username: "roy_boy",first_name: "roy", last_name: "mosby", title: "chief editor", password: "password")
journalist = Employee.create!(username: "sam_croy", first_name: "samantha", last_name: "croix", title: "journalist at large", password: "password")
journalist_2 = Employee.create!(username: "levon_j", first_name: "levon", last_name: "johnson", title: "journalist at large", password: "password")
intern = Employee.create!(username: "gotcha_22", first_name: "larry", last_name: "grotch", title: "newsroom intern", password: "password")

#content prep for articles
def fake_content
  Faker::Lorem.paragraphs(number: 5).join
end
def fake_title
  Faker::Company.bs
end

def pub_date
  Faker::Date.between(from: '2019-09-23', to: '2021-04-30')
end

#articles: new
Article.create!(title: "This one is unassigned", content: fake_content)
Article.create!(title: "this one is assigned", employee_id: journalist.id, content: fake_content)
Article.create!(title: "this one is also assigned", employee_id: journalist_2.id, content: fake_content)

#articles: approved
Article.create!(title: "Article approved #1", employee_id: journalist_2.id, content: fake_content, status: "approved")
Article.create!(title: "Article approved #2", employee_id: journalist_2.id, content: fake_content, status: "approved")
Article.create!(title: "Article approved but unassigned", employee_id: journalist_2.id, content: fake_content, status: "approved")

#articles: review
Article.create!(title: "Article for review #1", employee_id: journalist.id, content: fake_content, status: "review")
Article.create!(title: "Article for review #2", employee_id: journalist_2.id, content: fake_content, status: "review")

# articles: published
10.times do |i| 
  j = [journalist, journalist_2]
  Article.create!(title: fake_title, employee: j[i%2], content: fake_content, status: "published", published_date: pub_date )
end

#editor_revision, article status edit
reviewed = Article.create!(title: "Article has review", employee_id: journalist.id, content: fake_content, status: "edit")
EditorRevision.create!(content: "Please update article title per meeting", reviewer_id: editor.id, article_id: reviewed.id)

#article_update

has_update = Article.create!(title: "Published article. Has update", content: fake_content, employee_id: journalist.id, status: "published", published_date: pub_date)
ArticleUpdate.create!(content: "Nostrum did not lorem that day.", article_id: has_update.id, updater_id: intern.id)


#roles
roles = ["create", "self_create", "approve", "assign", "self_assign", "edit", "review", "publish", "update"]

#TODO roles need to be pre-populated into production database
roles.each { |r| Role.create!(role: r)}

#employee_roles
create = Role.find_by(role: "create")
self_create = Role.find_by(role: "self_create")
approve = Role.find_by(role: "approve")
assign = Role.find_by(role: "assign")
self_assign = Role.find_by(role: "self_assign")
edit = Role.find_by(role: "edit")
review = Role.find_by(role: "review")
publish = Role.find_by(role: "publish")
update = Role.find_by(role: "update")

sr_editor.roles << [create, approve, self_assign, edit, review, publish, update]
editor.roles << [approve, edit, review, publish, update]
journalist.roles << [self_create, self_assign, edit, update]
journalist_2.roles << [self_create, self_assign, edit, update]
intern.roles << [create, assign, update]

#tags
tags = ["rails", "ruby", "gem", "hotfix", "internet", "ux", "community", "templating", "library", "feature"]
tags.each { |t| Tag.create!(tag: t)}

#article_tags
tagged_article = Article.create!(title: "Tagged article", content: fake_content, employee_id: journalist_2.id, status: "published", published_date: pub_date)
tagged_article.tags << [Tag.first, Tag.second, Tag.third]