class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  def sender?(this_user)
    user.id == this_user.id
  end
end
