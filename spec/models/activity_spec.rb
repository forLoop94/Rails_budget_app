require 'rails_helper'

RSpec.describe Activity, type: :model do
  let(:user) { User.create(name: 'Forloop', email: 'forloop@gmail.com', password: '123456') }
  let(:activity) { Activity.new(name: 'dead zone', author: user, amount: 12) }

  it 'the activity should be valid' do
    expect(activity).to be_valid
  end
  it 'Without the name, the activity is not valid' do
    activity.name = ''
    expect(activity).not_to be_valid
  end
  it 'Without the author, the activity is not valid' do
    activity.author = nil
    expect(activity).not_to be_valid
  end
  it 'Without the amount, the activity is not valid' do
    activity.amount = nil
    expect(activity).not_to be_valid
  end
end