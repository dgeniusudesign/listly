class ListAuthorization < ActiveRecord::Base
  belongs_to :share_list, class_name: "List"
  belongs_to :share_user, class_name: "User"
end
