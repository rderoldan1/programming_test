# Preview all emails at http://localhost:3000/rails/mailers/people_mailer
class PeopleMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/people_mailer/created
  def created
    PeopleMailer.created
  end

  # Preview this email at http://localhost:3000/rails/mailers/people_mailer/deleted
  def deleted
    PeopleMailer.deleted
  end

end
