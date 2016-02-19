class AccountCancellationNewPage
  include PageObject

  page_url "https://<%= params[:subdomain] %>.beanstalkapp.com/account_cancellation/new"

  text_field(:password, id: 'password')
  checkbox(:refund_agreement, id: 'agreement')
  button(:submit_cancellation, value: 'Cancel this account')

  def cancel_account
    password_element.when_present
    self.password = 'Beanstalk123!'
    check_refund_agreement
    submit_cancellation
  end
end
