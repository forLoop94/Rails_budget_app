require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'Forloop', email: 'forloop@gmail.com', password: '123456') }
  let(:category) { Category.new(name: 'books', icon: 'https://media.gettyimages.com/id/157482029/photo/stack-of-books.jpg?s=612x612&w=gi&k=20&c=_Yaofm8sZLZkKs1eMkv-zhk8K4k5u0g0fJuQrReWfdQ=', user_id: user.id) }
  it 'the category should be valid' do
    expect(category).to be_valid
  end
  it 'Without the name, the category is not valid' do
    category.name = ''
    expect(category).not_to be_valid
  end
  it 'Without the user, the category is not valid' do
    category.user_id = nil
    expect(category).not_to be_valid
  end
end
