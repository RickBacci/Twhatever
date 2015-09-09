require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.find_or_create_from_oauth(mock_auth) }

  def mock_auth
    {
      "provider" => "twitter",
      "uid"      => ENV['test_uid'],
      "info"     => {
        "nickname"    => "me",
        "name"        => "JOE SMOE",
        "location"    => "Home",
        "image"       => "pic.jpg",
        "description" => "Description",
      },
      "credentials" => {
        "token" => ENV['test_token']
      }
    }
  end

  it 'creates a valid user from an auth hash' do
    expect(user).to be_valid
  end

  it 'has an oauth provider' do
    expect(user.provider).to eql('twitter')
  end
  it 'has a uid' do
    expect(user.uid).to eql(ENV['test_uid'])
  end

  it 'has a nickname' do
    expect(user.nickname).to eql('me')
  end

  it 'has a name' do
    expect(user.name).to eql('JOE SMOE')
  end

  it 'has a location' do
    expect(user.location).to eql('Home')
  end

  it 'has an image' do
    expect(user.image).to eql('pic.jpg')
  end

  it 'has an description' do
    expect(user.description).to eql('Description')
  end

  it 'has a token' do
    expect(user.token).to eql(ENV['test_token'])
  end
end
