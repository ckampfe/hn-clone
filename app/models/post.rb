class Post < ActiveRecord::Base
  alias_attribute :submitter_id, :user_id
  has_many   :comments
  belongs_to :user
end
