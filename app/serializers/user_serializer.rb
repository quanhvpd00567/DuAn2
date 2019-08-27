class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :gender, :email, :display_gender

  def self.get_list
	User::all
  end

  
end
