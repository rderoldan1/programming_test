class PeopleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.people_mailer.created.subject
  #
  def created(name, person_id)
    @person = Person.find(person_id)
    @person_created = name

    mail to: @person.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.people_mailer.deleted.subject
  #
  def deleted(name, person_id)
    @person = Person.find(person_id)
    @person_deleted = name

    mail to: @person.email
  end
end
