class DashboardPage
  include PageObject

  link(:edit_profile, href: '/profile/edit')
  h1(:welcome_message, index: 0)
end
