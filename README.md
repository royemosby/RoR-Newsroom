# RoR Newsroom

## TOC

- About
- How to install (on local system) *requires GitHub OAuth
- Contributor's guide
- License

## About RoR Newsroom

## How to install (on local system)

1. Download or clone this repo.
2. Open terminal to the top level directory of this project and type `bundle install`
3. Type `rails db:migrate` to install the sqlite database (will be found at ./db/development.sqlite3)
4. Populate database with demo content by typing `rails db:seed`.
5. Register a new OAuth app with Github at [developer settings](https://github.com/settings/developers)
   1. Go to link above then click on the OAuth Apps vertical tab.
   2. Click "New OAuth App"
   3. Give it a meaningful name like "RoR Newsroom"
   4. Set the homepage URL to `http://localhost:3000/`
   5. Set the Authorization callback URL to `http://localhost:3000/auth/github/callback`
   6. Fill in the rest of the information as you deem fit.
6. Start the rails server by typing `rails s`
7. Open `localhost:3000` in a new browser window and start interacting with RoR Newsroom!

## Contributor's guide

Bottom line: I will be a kind human. Please be the same in return.

Please submit a contribution idea through an issue ticket before working on a pull request. Don't submit a pull request unless it has been discussed through an issue ticket. I happily respond to all contructive inquiries.

As this project evolves, I will update this readme and how contributions are accepted.

## This project uses the [standard MIT license](LICENSE)