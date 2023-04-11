require 'rails_helper'

RSpec.describe 'posts/show', type: :feature do
  before(:each) do
    @img = 'https://i0.wp.com/imgs.hipertextual.com/wp-content/uploads/2022/10/Andor_Luthen-Rael.png?fit=2554,1642&quality=60&strip=all&ssl=1'
    @author = User.create(name: 'Tom', photo: @img, bio: 'Teacher from South Africa')
    @first_post = Post.create(author: @author, title: 'Tom Post #1', text: "This is Tom's first post")
    @first_comment = Comment.create(post: @first_post, author: @author, text: 'First comment for Tom')
    @second_comment = Comment.create(post: @first_post, author: @author, text: 'Second comment for Tom')
    @third_comment = Comment.create(post: @first_post, author: @author, text: 'Third comment for Tom')

    @first_like = Like.create(post: @first_post, author: @author)
    @second_like = Like.create(post: @first_post, author: @author)
    @third_like = Like.create(post: @first_post, author: @author)

    visit user_post_path(@first_post.author, @first_post)
  end

  it "shows the post's title" do
    expect(page).to have_content(@first_post.title)
  end

  it "shows the post's author" do
    expect(page).to have_content(@first_post.author.name)
  end

  it 'shows the number of comments on the post' do
    expect(page).to have_content('Comments: 3')
  end

  it 'shows the number of likes on the post' do
    expect(page).to have_content('Likes: 3')
  end

  it "shows the post's text" do
    expect(page).to have_content(@first_post.text)
  end

  it "shows the username of the comment's author" do
    expect(page).to have_content(@first_comment.author.name)
  end

  it "shows the comment's text" do
    expect(page).to have_content(@first_comment.text)
  end
end
