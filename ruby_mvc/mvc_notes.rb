all things that deal with data/database need to be inside a folder/class called Models.
all things that deal with HTML rendering need to be inside a folder/class called Views.
all things that deal with handling the URL request need to be inside a folder/class called routes.
all things that deal with business logic need to be inside a folder/class called Controllers.
we'll have a config folder where we can store things related to configuring the app (database, session, security encryption, etc.).'

method testing!
try to write in complete sentences as close as possible
##################
helpful rails console queries:

* user = User.new
* user.valid? # was a valid entry submitted?
* user.save # save new/updated entry to the database
* user.errors # what went wrong?
* user.errors.full_messages # a simplier, cleaner, easier-to-read version of the errors
* reload! # update the console after making (and saving!) changes to your models.rb file


##################
# retrieving all rows in the users table
users = User.all
Copy# retrieving the first row in the users table
user = User.first
# retrieving the second row in the users table
user2 = User.second
# retrieving the last row in the users table
last_user = User.last
# retrieving the user with id = 2
user = User.find(2)
# retrieving the first user with the first name John
john = User.find_by(first_name: "John")
# retrieving all the users with the first name John
johns = User.where(first_name: "John")
# retrieving all users with the last name Doe but only selecting the first name and last name column
does = User.where(last_name: "Doe").select(:first_name, :last_name)

# retrieving the user, setting the first name attribute to a different value then saving the record
user = User.find(1)
user.first_name = "Some Other Name"
user.last_name = "Some Other Last Name"
user.save

# retrieving the user then updating and saving multiple attributes
user = User.last
user.update(first_name: "James", last_name: "Doe", age: 40)

user = User.first.destroy
user2 = User.last.delete
