# README

Restful API Citizens Advise Test.

## Models List
User
Group
UsersGroup

## Routes 
user assign to group route
POST localhost:3000/user/assign

groups create route
POST localhost:3000/groups

user login route
POST localhost:3000/auth/login

user create route
POST localhost:3000/users

## Running Instructions
1. bundle install
2. rails db:create
3. rails db:migrate
4. rails s

*Note: Validations & tests are not covered in this api
**Totel Time: 1:50 MIN + 30 MIN (For testing api)
