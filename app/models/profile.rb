class Profile < ApplicationRecord
  belongs_to :user
  enum usertypes: {individual:0 , company: 1, bulkuser: 2}
  # creating an enum to usertype and used that in view
end
