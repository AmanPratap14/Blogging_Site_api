# Blogging_Site_api

This is blogging _site API in dotnet, C# where a client can add User: details, job info,  and post the blogs
add required packages with dotnet add package "PackageName",
add DataBase Connection String to connect the database,
This is C# and Dotnet APIs
﻿

GET
http://localhost:5000/Auth/RefreshToken
http://localhost:5000/Auth/RefreshToken
To get a new Token of login

Request Headers
Authorization
Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxMDAzIiwibmJmIjoxNjkwNjEyMzc2LCJleHAiOjE2OTA2OTg3NzYsImlhdCI6MTY5MDYxMjM3Nn0.nauh3zNO59Wx6GZ3IdTF92Fcddg7YIZf08YjcnRPdH9HNZxUDvx6sl6KY7DtWVLyQ0w9MnKhZ-F-d4IAloxLug
GET
http://localhost:5000/Post/Posts/0/0/None
http://localhost:5000/Post/Posts/0/0/None
To get all Post with Posts/0/0/none

Request Headers
Authorization
Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxMDAzIiwibmJmIjoxNjkwNjEyMzc2LCJleHAiOjE2OTA2OTg3NzYsImlhdCI6MTY5MDYxMjM3Nn0.nauh3zNO59Wx6GZ3IdTF92Fcddg7YIZf08YjcnRPdH9HNZxUDvx6sl6KY7DtWVLyQ0w9MnKhZ-F-d4IAloxLug
GET
http://localhost:5000/Post/MyPosts
http://localhost:5000/Post/MyPosts
to get only a single UserId's all Posts

Request Headers
Authorization
Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxMDAzIiwibmJmIjoxNjkwNjEyMzc2LCJleHAiOjE2OTA2OTg3NzYsImlhdCI6MTY5MDYxMjM3Nn0.nauh3zNO59Wx6GZ3IdTF92Fcddg7YIZf08YjcnRPdH9HNZxUDvx6sl6KY7DtWVLyQ0w9MnKhZ-F-d4IAloxLug
PUT
http://localhost:5000/Post/MyPosts
http://localhost:5000/Post/UpsertPost
this Put/Update request either creates a new post or Update

Request Headers
Authorization
Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxMDAzIiwibmJmIjoxNjkwNjEyMzc2LCJleHAiOjE2OTA2OTg3NzYsImlhdCI6MTY5MDYxMjM3Nn0.nauh3zNO59Wx6GZ3IdTF92Fcddg7YIZf08YjcnRPdH9HNZxUDvx6sl6KY7DtWVLyQ0w9MnKhZ-F-d4IAloxLug
Body
raw (json)
JSON
{
    "postId": 5,
    "postTitle": "Fourth test :Post4 updaite",
    "postContent": "this is testing for updating POst5"    
}
DELETE
http://localhost:5000/Post/Post/3
http://localhost:5000/Post/Post/1
To delete the Post with PostId current User and thus not able to delete other user's posts

Request Headers
Authorization
Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxMDAzIiwibmJmIjoxNjkwNjEyMzc2LCJleHAiOjE2OTA2OTg3NzYsImlhdCI6MTY5MDYxMjM3Nn0.nauh3zNO59Wx6GZ3IdTF92Fcddg7YIZf08YjcnRPdH9HNZxUDvx6sl6KY7DtWVLyQ0w9MnKhZ-F-d4IAloxLug
