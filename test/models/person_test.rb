# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  job        :string(255)
#  bio        :text(65535)
#  gender     :string(255)
#  birthdate  :date
#  picture    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
   setup do
      @person = people(:one)
   end

   test "invalid without first name" do
      @person.first_name = nil
      assert @person.valid? == false
      assert_includes @person.errors.messages.keys, :first
      assert_includes @person.errors.messages.values, "can\'t be blank"
   end

   test "invalid without last name" do
      @person.last_name = nil
      assert @person.valid? == false
      assert_includes @person.errors.messages.keys, :last_name
      assert_includes @person.errors.messages.values, "can\'t be blank"

   end

   test "invalid without email" do
      @person.last_name = nil
      assert @person.valid? == false
      assert_includes @person.errors.messages.keys, :email
      assert_includes @person.errors.messages.values, "can\'t be blank"
   end

   test "#full_name" do
      assert @person.full_name == "Ruben Espinosa"
   end

   test "#age" do
      @person.birthdate = Date.today - 25.years
      assert @person.age == 25, "Age must be equal to 26"
   end
end
