class SignupPage
  include PageObject

  page_url 'https://signup.beanstalkapp.com/'

  text_field(:name, id: 'user_name')
  text_field(:email, id: 'user_email')
  text_field(:username, id: 'user_login')
  text_field(:account_name, id: 'account_name')
  text_field(:subdomain, id: 'account_third_level_domain')
  text_field(:password, id: 'user_password')
  radio_button(:free_plan, id: 'plan_Free')
  span(:free_span) { free_plan_element.element.parent.span }
  checkbox(:terms, id: 'terms')
  button(:submit, class: 'btn btn-submit')
  div(:error_message, class: 'form-error-main')

  def input_user_details(params={})
    name_element.when_present
    self.name = params[:name] || Faker::Name.name
    self.email = params[:email] || Faker::Internet.email
    self.username = params[:username] || Faker::Name.last_name + Faker::Number.hexadecimal(4)
    self.account_name = params[:account_name] || Faker::Company.name
    self.subdomain = params[:subdomain] || Faker::Hipster.word + Faker::App.name
    self.password = params[:password] || 'Beanstalk123!'
  end
end
