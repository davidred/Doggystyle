# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  from       :integer          not null
#  to         :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

describe Message do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:message)).to be_valid
  end


  it 'is valid with body from and to' do
    message = Message.new(
      body: 'hey there',
      from: 1,
      to: 2
    )
    expect(message).to be_valid
  end

  it 'is invalid without a body' do
    expect(FactoryGirl.build(:message, body: nil)).to_not be_valid
  end

  it 'is invalid without a from' do
    expect(FactoryGirl.build(:message, from: nil)).to_not be_valid
  end

  it 'is invalid without a to' do
    expect(FactoryGirl.build(:message, to: nil)).to_not be_valid
  end
end
