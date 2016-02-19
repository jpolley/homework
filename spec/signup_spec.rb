describe 'Create account' do
  context 'free plan' do
    before(:all) do
      @name = Faker::Name.name
      @first_name = @name.split(' ')[0]
      @username = Faker::Number.hexadecimal(10)
      @subdomain = Faker::App.name

      visit SignupPage do |page|
        page.input_user_details(
          name: @name,
          username: @username,
          subdomain: @subdomain
        )
        page.free_span_element.click
        page.check_terms
        page.submit
      end

      on DashboardPage do |page|
        page.edit_profile_element.when_present
      end
    end

    after(:all) do
      visit AccountCancellationNewPage, using_params: { subdomain: @subdomain } do |page|
        page.cancel_account
      end
    end

    it 'url is correct' do
      expect(@browser.url).to eq("https://#{@subdomain.downcase}.beanstalkapp.com/?first_visit=true&plan=Free")
    end

    it 'name displayed in profile link' do
      on DashboardPage do |page|
        expect(page.edit_profile_element.text).to eq(@name)
      end
    end

    it 'name displayed in welcome message' do
      on DashboardPage do |page|
        expect(page.welcome_message).to include(@first_name)
      end
    end
  end
end
