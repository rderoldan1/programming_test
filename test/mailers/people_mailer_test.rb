require 'test_helper'

class PeopleMailerTest < ActionMailer::TestCase
  test "created" do
    mail = PeopleMailer.created
    assert_equal "Created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "deleted" do
    mail = PeopleMailer.deleted
    assert_equal "Deleted", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
