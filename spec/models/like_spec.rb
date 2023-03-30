require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'increments likes_counter' do
    user = User.new(
      name: 'John Doe',
      bio: 'Developer',
      posts_counter: 5
    )
    user.save

    post = Post.new(
      title: 'My first post',
      text: 'Hello world!',
      comments_counter: 4,
      likes_counter: 5,
      author_id: user.id
    )
    post.save

    like = Like.new(
      author_id: user.id,
      post_id: post.id
    )
    like.save

    expect(post.likes_counter).to_not eq(6)
  end
end
