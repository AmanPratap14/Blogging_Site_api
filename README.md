# Blogging_Site_api

This is blogging _site API in dotnet, C# where a client can add User: details, job info,  and post the blogs
add required packages with dotnet add package "PackageName",
add DataBase Connection String to connect the database,
This is C# and Dotnet APIs


 # C# and Dotnet APIs

## Auth API

### GET /Auth/RefreshToken

To get a new Token of login.

#### Request Headers
Authorization: Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxMDAzIiwibmJmIjoxNjkwNjEyMzc2LCJleHAiOjE2OTA2OTg3NzYsImlhdCI6MTY5MDYxMjM3Nn0.nauh3zNO59Wx6GZ3IdTF92Fcddg7YIZf08YjcnRPdH9HNZxUDvx6sl6KY7DtWVLyQ0w9MnKhZ-F-d4IAloxLug


## Post API

### GET /Post/Posts/0/0/None

To get all Posts.

#### Request Headers
Authorization: Bearer  ''


### GET /Post/MyPosts

To get all posts of the single UserId.

#### Request Headers
Authorization: Bearer ""



### PUT /Post/MyPosts

This Put/Update request either creates a new post or updates an existing one.

#### Request Headers
Authorization: Bearer ""

#### Body (raw - json)

```json
{
    "postId": 5,
    "postTitle": "Fourth test: Post4 update",
    "postContent": "This is testing for updating Post5"
}


DELETE /Post/Post/3
To delete the Post with the postId of the current User. This does not allow deleting other users' posts.

Request Headers
Authorization: Bearer 
