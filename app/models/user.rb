class User < ActiveRecord::Base
  validates :username, uniqueness: true, presence: true

  has_many(
    :contacts,
    class_name: "Contact",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many :contact_shares,
    class_name: "ContactShare",
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy

  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact,
    dependent: :destroy
end
