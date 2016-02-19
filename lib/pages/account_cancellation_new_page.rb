class AccountCancellationNewPage
  include PageObject

  page_url "https://<%= params[:subdomain] %>.beanstalkapp.com/account_cancellation/new"

  text_field(:password, id: 'password')
  checkbox(:refund_agreement, id: 'agreement')
  button(:submit_cancellation, value: 'Cancel this account')

  def cancel_account
    self.password = 'Beanstalk123!'
    self.check_refund_agreement
    self.submit_cancellation
  end
end
