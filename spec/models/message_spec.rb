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
  it 'is valid with body from and to' do
    message = Message.new(
      body: 'hey there',
      from: 1,
      to: 2
    )
    expect(message).to be_valid
  end

  it 'is invalid without a body' do
    message = Message.new(body: nil)
    message.valid?
    expect(message.errors[:body]).to include("can't be blank")
  end

  it 'is invalid without a from' do
    message = Message.new(from: nil)
    message.valid?
    expect(message.errors[:from]).to include("can't be blank")
  end

  it 'is invalid without a to' do
    message = Message.new(to: nil)
    message.valid?
    expect(message.errors[:to]).to include("can't be blank")
  end
end
