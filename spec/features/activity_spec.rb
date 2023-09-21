require 'rails_helper'
RSpec.describe 'categories page', type: :system do
  include Devise::Test::IntegrationHelpers

  let!(:user1) do
    User.create!(
      name: 'charles',
      email: 'forloop@mail.com',
      password: '123456',
      password_confirmation: '123456',
      confirmed_at: Time.now
    )
  end

  let!(:category) do
    Category.create!(
      name: 'food',
      icon: 'https://tse2.mm.bing.net/th?id=OIP.H-JJ97qWShgZbn6IzNEkpAHaHa&pid=Api&P=0&h=180',
      user_id: user1.id
    )
  end

  let!(:activities) do
    category.activities.create!([
                                  { name: 'burger', amount: 12, author: user1 },
                                  { name: 'chips', amount: 5, author: user1 }
                                ])
  end

  describe 'show correct activities for a category' do
    before(:example) do
      sign_in user1
      visit category_path(category)
    end
    it 'has total amount' do
      expect(page).to have_content('Total amount:')
    end
    it 'has Back to categories button' do
      expect(page).to have_button('Back to categories')
    end

    it 'has new destroy category link' do
      expect(page).to have_button('Destroy this category')
    end
    it 'has activity details' do
      activities.each do |activity|
        expect(page).to have_content(activity.name)
        expect(page).to have_content(activity.amount)
      end
    end
  end
end
