class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :user_type, :name, :password_digest
end
