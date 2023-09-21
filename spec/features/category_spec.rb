require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  before(:each) do
    @user = User.create(name: 'Forloop', email: 'forloop@gmail.com', password: '123456')
    @category = @user.categories.create(
      icon: 'https://media.gettyimages.com/id/157482029/photo/stack-of-books.jpg?s=612x612&w=gi&k=20&c=_Yaofm8sZLZkKs1eMkv-zhk8K4k5u0g0fJuQrReWfdQ=', name: 'books'
    )
    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'
  end

  describe 'show page' do
    before do
      visit category_path(@category)
    end

    it 'Displays the category activities' do
      expect(page).to have_content('This category is empty!')
    end

    it 'Displays new activity button' do
      page.should have_button('New activity')
    end
  end

  describe 'index page' do
    before do
      visit categories_path
    end

    it 'Displays a Category name' do
      expect(page).to have_content(@category.name)
    end

    it 'the page title' do
      expect(page).to have_content('Categories')
    end

    it 'Displays Total Amount' do
      expect(page).to have_content('$0')
    end

    it 'Displays add new Category button' do
      page.should have_button('New category')
    end
  end

  describe 'New and create' do
    before do
      visit new_category_path
      fill_in 'category[name]', with: 'Dead zone'
      fill_in 'category[icon]', with: 'https://media.gettyimages.com/id/157482029/photo/stack-of-books.jpg?s=612x612&w=gi&k=20&c=_Yaofm8sZLZkKs1eMkv-zhk8K4k5u0g0fJuQrReWfdQ='
      click_button 'Create'
    end

    it 'Displays the Category name' do
      expect(page).to have_content('Dead zone')
    end
  end
end