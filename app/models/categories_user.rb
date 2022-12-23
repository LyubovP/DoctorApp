# == Schema Information
#
# Table name: categories_users
#
#  category_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_categories_users_on_category_id_and_user_id  (category_id,user_id)
#  index_categories_users_on_user_id_and_category_id  (user_id,category_id)
#
class CategoriesUser < ApplicationRecord
  belongs_to :category
  belongs_to :user
end
