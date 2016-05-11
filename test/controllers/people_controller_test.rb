require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get people_url
    assert_response :success
  end

  test "should get new" do
    get new_person_url
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post people_url, params: { person: { first_name: Faker::Name.first_name,
                                           last_name: Faker::Name.last_name,
                                           email: Faker::Internet.email,
                                           job: Faker::Company.name,
                                           bio: Faker::Lorem.paragraph,
                                           picture: Faker::Avatar.image,
                                           birthdate: Faker::Date.backward(5000) } }
    end

    assert_redirected_to person_path(Person.last)
  end

  test "should show person" do
    get person_url(@person)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_url(@person)
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: { person: { first_name: Faker::Name.first_name,
                                                   last_name: Faker::Name.last_name,
                                                   email: Faker::Internet.email,
                                                   job: Faker::Company.name,
                                                   bio: Faker::Lorem.paragraph,
                                                   picture: Faker::Avatar.image,
                                                   birthdate: Faker::Date.backward(5000) } }
    assert_redirected_to person_path(@person)
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_path
  end
end
