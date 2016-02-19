class DashboardPage
  include PageObject

  link(:edit_profile, href: '/profile/edit')
  h1(:welcome_message)
  link(:account, href: '/account/edit')
end
