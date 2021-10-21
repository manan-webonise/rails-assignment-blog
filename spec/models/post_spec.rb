require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    let(:post) { FactoryBot.build(:post) }
    it 'should have a title' do
      post.title = nil
      post.body = 'This is body of post'
      expect(post).to_not be_valid
    end
  end

  describe 'validations' do
    let(:post) { FactoryBot.build(:post) }
    it 'should have body' do
      post.title = 'title'
      post.body = nil
      expect(post).to_not be_valid
    end
  end

  describe 'validations' do
    let(:post) { FactoryBot.build(:post) }
    it 'should have more than 10 characters in body' do
      post.title = 'title'
      post.body = 'Hi'
      expect(post).to_not be_valid
    end
  end

  describe 'validations' do
    let(:post) { FactoryBot.build(:post) }
    it 'should have a title' do
      post.title = 'Title'
      post.body = 'This is body of post'
      expect(post).to be_valid
    end
  end
end
