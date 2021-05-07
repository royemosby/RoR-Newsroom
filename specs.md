# Specifications for the Rails Assessment

Specs:

- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship: **Employee HAS MANY Articles**
- [x] Include at least one belongs\_to relationship **Article BELONGS TO Employee**
- [x] Include at least two has\_many through relationships (x has\_many y through z; e.g. Recipe has_many Items through Ingredients): **Employee HAS MANY Roles THROUGH Employee Roles, Article HAS MANY Tags THROUGH ArticleTags**
- [x] Include at least one many-to-many relationship (x has\_many y through z, y has\_many x through z; e.g. Recipe has\_many Items through Ingredients, Item has\_many Recipes through Ingredients) **Employee HAS MANY Roles THROUGH Employee Roles, Roles HAS MANY Employees THROUGH Roles**
- [x] The "through" part of the has\_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute\_name e.g. ingredients.quantity) **Employee (as reviewer) HAS MANY EditorRevisions. EditorRevisions includes field "content" for review notes**
- [x] Include reasonable validations for simple model objects. **Article validates title, content length. EditorRevision validates content. Employee validates username. Role validates role. Tag validates tag**
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most\_recipes URL: /users/most\_recipes) **Article scopes status_published, drafts, by_status**
- [x] Include signup **workspace::employees#create**
- [x] Include login **sessions#new as login, session#create as username_pw_login**
- [x] Include logout **sessions#destroy as logout**
- [x] Include third party signup/login **sessions#new as login, omniauth routes back into sessions#create**
- [x] Include nested resource show or index: **resources->tags, workspace::articles->editor_revisions, workspace::emlployees->articles**
- [x] Include nested resource "new" form **workspace::articles->editor_revisions**
- [x] Include form display of validation errors (form URL e.g. /recipes/new) **app/views/workspace/articles/_form.html.erb, app/views/workspace/employees/_form.html.erb. Other alerts, notices, successes are displayed via flash messages at app/views/layouts/_messages.html.erb**

Confirm:

- [x] The application is pretty DRY
- [x] Limited logic in controllers 
- [x] Views use helper methods if appropriate **workspace/articles_helper.rb, workspace/employees_helper.rb, news_helper.rb, tags_helper.rb**
- [x] Views use partials if appropriate **numerous**
