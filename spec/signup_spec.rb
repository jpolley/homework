describe 'Create account' do
  context 'free plan' do
    before(:all) do
      @name = Faker::Name.name
      @first_name = @name.split(' ')[0]
      @username = Faker::Number.hexadecimal(7)
      @subdomain = Faker::Hipster.word + Faker::App.name

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
      on DashboardPage do |page|
        page.account
      end


    end

    it 'project url is correct' do
      expect(@browser.url).to eq("https://#{@subdomain}.beanstalkapp.com/?first_visit=true&plan=Free")
    end

    it 'name displayed in profile link' do
      on DashboardPage do |page|
        expect(page.edit_profile_element.text).to eq(@name)
      end
    end

    it 'name displayed in welcome message' do
      on DashboardPage do |page|
        expect(page.welcome_message).to eq("Hi #{@first_name}, you’re awesome!")
      end
    end
  end
end
