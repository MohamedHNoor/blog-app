# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://i0.wp.com/imgs.hipertextual.com/wp-content/uploads/2022/10/Andor_Luthen-Rael.png?fit=2554,1642&quality=60&strip=all&ssl=1')
second_user = User.create(name: 'Lilly', photo: 'https://lumiere-a.akamaihd.net/v1/images/bix-caleen-main-b_1450fe71.jpeg?region=103%2C0%2C1427%2C803&width=960', bio: 'Teacher from Poland.')

first_post = Post.create(author: first_user, title: 'Tom Post #1', text: "This is Tom's first post")
second_post = Post.create(author: second_user, title: 'Lilly Post #1', text: "This is Lilly's first post")
third_post = Post.create(author: first_user, title: 'Tom Post #2', text: "This is Tom's second post")
fourth_post = Post.create(author: second_user, title: 'Lilly Post #2', text: "This is Lilly's second post")

Comment.create(post: first_post, author: first_user, text: 'First comment for Tom' )
Comment.create(post: second_post, author: second_user, text: 'Second comment for Lilly' )
Comment.create(post: third_post, author: first_user, text: 'First comment for Tom' )
Comment.create(post: fourth_post, author: second_user, text: 'Second comment for Lilly' )

Like.create(post: first_post, author: first_user)
Like.create(post: second_post, author: second_user)
Like.create(post: third_post, author: first_user)
Like.create(post: fourth_post, author: second_user)


