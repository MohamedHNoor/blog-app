# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Post.destroy_all 
Comment.destroy_all

user1 = User.create!(
  name: "Tom",
  photo: "https://picsum.photos/200/300",
  bio: "This is user 1 bio",
  email: "hello1@gmail.com",
  password: "password1"
)

user2 = User.create!(
  name: "Lilly",
  photo: "https://picsum.photos/200/300",
  bio: "This is user 2 bio",
  email: "hello2@gmail.com",
  password: "password2"
)

user3 = User.create!(
  name: "John",
  photo: "https://picsum.photos/200/300",
  bio: "This is user 3 bio",
  email: "hello3@gmail.com",
  password: "password3"
)

post1 = Post.create!(
  title: "Post 1",
  text: "This is post 1 content",
  author: user1
)

post2 = Post.create!(
  title: "Post 2",
  text: "This is post 2 content",
  author: user2
)

post3 = Post.create!(
  title: "Post 3",
  text: "This is post 3 content",
  author: user3
)

comment1 = Comment.create!(
  text: "This is comment 1",
  author: user1,
  post: post1
)

comment2 = Comment.create!(
  text: "This is comment 2",
  author: user2,
  post: post2
)

comment3 = Comment.create!(
  text: "This is comment 3",
  author: user3,
  post: post3
)

like1 = Like.create!(
  author: user1,
  post: post1
)

like2 = Like.create!(
  author: user2,
  post: post2
)

like3 = Like.create!(
  author: user3,
  post: post3
)



