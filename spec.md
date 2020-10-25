# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database. Have 3 class that inherit from              'ActiveRecord::Base' and do all CRUD with ActiveRecord.
- [x] Include more than one model class (e.g. User, Post, Category)  Models are: Category, Recipe, User)
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) User has_many Recipes. Category has many Recipes. 
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) Recipes are belong_to a User and belong_to a Category.
- [x] Include user accounts with unique login attribute (username or email) The username should be uniq in Signup page.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying. recipes_controller has routes for Creating, Reading, Updating and Destroying Recipes.
- [x] Ensure that users can't modify content created by other users. For editing and deleteting a Recipe, Check if that Recipe belongs_to the current User, and if it's not just return a message to User that he can't change or delete the Recipe.
- [x] Include user input validations. With 'validates_presence_of' Check if username, email and password has value.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) Have lots of error message for signup, login, edit or deleting Recipes.
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits. Tryied to commit every small code that I wrote.
- [x] Your commit messages are meaningful.
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
