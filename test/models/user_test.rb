# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#self.from_omniauth' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
      {
        provider: 'github',
        uid: '12345',
        info: {
          name: 'carol',
          email: 'carol@example.com'
        },
        credentials: {
          token: Devise.friendly_token[0, 20]
        }
      }
    )
    assert User.from_omniauth(OmniAuth.config.mock_auth[:github])
  end

  test '#following_user' do
    alice = users('alice')
    bob = users('bob')

    assert_not alice.followings.include?(bob)
    alice.follow(bob)
    assert alice.followings.include?(bob)
  end

  test '#followed_by_user' do
    alice = users('alice')
    bob = users('bob')

    assert_not bob.followers.include?(alice)
    alice.follow(bob)
    assert bob.followers.include?(alice)
  end

  test '#follow' do
    alice = users('alice')
    bob = users('bob')

    assert_not alice.following?(bob)
    alice.follow(bob)
    assert alice.following?(bob)
  end

  test '#unfollow' do
    alice = users('alice')
    bob = users('bob')

    alice.follow(bob)
    assert alice.following?(bob)
    alice.unfollow(bob)
    assert_not alice.following?(bob)
  end

  test '#name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'Foo Bar'
    assert_equal 'Foo Bar', user.name_or_email
  end
end
