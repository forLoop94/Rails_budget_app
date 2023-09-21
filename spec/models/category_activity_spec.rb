require 'rails_helper'

RSpec.describe CategoryActivity, type: :model do
  let(:user) { User.create(name: 'Charles', email: 'charles@gmail.com', password: '123456') }
  let(:activity) { Activity.new(name: 'dead zone', author: user, amount: 12) }
  let(:category) { Category.new(name: 'books', icon: 'https://media.gettyimages.com/id/157482029/photo/stack-of-books.jpg?s=612x612&w=gi&k=20&c=_Yaofm8sZLZkKs1eMkv-zhk8K4k5u0g0fJuQrReWfdQ=', user_id: user.id) }
  let(:category_activity) { CategoryActivity.new(category:, activity:) }

  it 'the category activity should be valid' do
    expect(category_activity).to be_valid
  end
  it 'Without the category, the category activity is not valid' do
    category_activity.category = nil
    expect(category_activity).not_to be_valid
  end
  it 'Without the activity, the category activity is not valid' do
    category_activity.activity = nil
    expect(category_activity).not_to be_valid
  end
end
