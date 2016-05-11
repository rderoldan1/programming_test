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

class Person < ApplicationRecord


  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, presence: true, length: 1..75
  validates :last_name, presence: true, length: 1..75
  validates :email, presence: true, length: 1..254, uniqueness: true, format: { with: EMAIL_REGEX }
  validates :bio, allow_blank: true, length: { minimum: 10 }
  validates :job, allow_blank: true, length: { maximum: 75 }
  validates :birthdate, date: { before: Proc.new { Time.now + 1.year } }

  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    age = Date.today.year - birthdate.year
    age -= 1 if Date.today < birthdate + age.years
    age
  end

  def created_email()
    Person.where.not(id: id).each do |person|
      PeopleMailer.created(full_name,  person.id).deliver_later
    end
  end

  def deleted_email
    Person.where.not(id: id).each do |person|
      PeopleMailer.deleted(full_name, person.id).deliver_later
    end
  end

end
