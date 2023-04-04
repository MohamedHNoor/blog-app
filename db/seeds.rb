# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

first_post = Post.create(author_id: first_user.id, title: 'Hello from first_user', text: 'This is my first post from Tom')
second_post = Post.create(author_id: second_user.id, title: 'Hello from second_user', text: 'This is my first post from Lilly')
third_post = Post.create(author_id: first_user.id, title: 'Hello first_user again', text: 'This is my second post from Tom')
fourth_post = Post.create(author_id: second_user.id, title: 'Hello from second_user again', text: 'This is my second post from Lilly')

first_comment = Comment.create(post_id: first_post.id, author_id: first_user.id,text: 'This is my first comment from Tom')
second_comment = Comment.create(post_id: second_post.id, author_id: second_user.id,text: 'This is my first comment from Lilly')
third_comment = Comment.create(post_id: third_post.id, author_id: first_user.id,text: 'This is my second comment from Tom')
fourth_comment = Comment.create(post_id: fourth_post.id, author_id: second_user.id,text: 'This is my second comment from Lilly')
fitfh_comment = Comment.create(post_id: first_post.id, author_id: second_user.id,text: 'This is my first comment from Lilly')
sixth_comment = Comment.create(post_id: second_post.id, author_id: first_user.id,text: 'This is my first comment from Tom')