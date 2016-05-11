require 'test_helper'

class PeopleMailerTest < ActionMailer::TestCase
  setup do
    @from = people(:one)
    @to = people(:two)
  end

  test "created" do
    mail = PeopleMailer.created(@from.full_name, @to.id)
    assert_equal "Created", mail.subject
    assert_equal [@to.email], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "has joined the application", mail.body.encoded
  end

  test "deleted" do
    mail = PeopleMailer.deleted(@from.full_name, @from.id)
    assert_equal "Deleted", mail.subject
    assert_equal [@from.email], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "has left the application.", mail.body.encoded
  end

end
