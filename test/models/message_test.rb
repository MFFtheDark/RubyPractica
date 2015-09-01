require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  test 'should accept valid attributes' do
    valid_attrs = {
      name: 'Tu',
      email: 'Tu@ex.com',
      subject: 'hola',
      content: 'adios'
    }

    msg = Message.new valid_attrs

    assert msg.valid?
  end
	test 'attributes can not be blank' do
    msg = Message.new
    refute msg.valid?
  end
end

