require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  test "succesful post" do
  assert_difference 'ActionMailer::Base.deliveries.size', 1 do
    post :create, message: {
      name: 'Yo',
      email: 'Yo@ex.com',
      subject: 'hola',
      content: 'adios'
    }
  end

  assert_redirected_to new_message_path
  last_email = ActionMailer::Base.deliveries.last

  assert_equal "hola", last_email.subject
  assert_equal 'Tu@ex.com', last_email.to[0]
  assert_equal 'Yo@ex.com', last_email.from[0]
  assert_match(/adios/, last_email.body.to_s)

  ActionMailer::Base.deliveries.clear
end

end
