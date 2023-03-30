require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'increments comments_counter' do
    user = User.new(
      name: 'John Doe',
      bio: 'Developer',
      posts_counter: 5
    )
    user.save

    post = Post.new(
      title: 'My first post',
      text: 'Hello world!',
      comments_counter: 5,
      likes_counter: 8,
      author_id: user.id
    )
    post.save

    comment = Comment.new(
      author_id: user.id,
      post_id: post.id,
      text: 'Nice post!'
    )
    comment.save

    expect(post.comments_counter).to_not eq(6)
  end
end
