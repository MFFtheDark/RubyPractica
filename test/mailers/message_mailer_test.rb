require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase

  test "message me" do
    msg = Message.new(
      name: 'Yo',
      email: 'Yo@ex.com',
      subject: 'Hola',
      content: 'Hola'
    )

    email = MessageMailer.message_me(msg).deliver_now

    refute ActionMailer::Base.deliveries.empty?

    assert_equal ['Tu@ex.com'], email.to
    assert_equal ['Yo@ex.com'], email.from
    assert_equal 'Hola', email.subject
    assert_equal 'Hola', email.body.to_s
  end
end
