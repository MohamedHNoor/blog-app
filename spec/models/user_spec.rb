require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'John Doe',
      photo: 'https://picsum.photos/200/300',
      bio: 'Developer',
      posts_counter: 5
    )
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should display posts_counter' do
    subject.posts_counter = 5
    expect(subject.posts_counter).to eq(5)
  end

  it 'posts_counter should be an integer' do
    subject.posts_counter = 5
    expect(subject.posts_counter).to be_an(Integer)
  end

  it 'should display most recent posts' do
    subject.posts_counter = 5
    expect(subject.most_recent_posts).to eq(subject.posts.last(5))
  end
end
