# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  content    :text
#  user_id    :integer
#  image      :text
#  created_at :datetime
#  updated_at :datetime
#

class Item < ActiveRecord::Base
  belongs_to :users
  has_many :item_prices 

  include PgSearch
  pg_search_scope :search_by_tsearch_but_rank_by_trigram, against: [:name, :content], using: {tsearch: {dictionary: "english"}}, ignoring: :accents

  # :search, against: [:name, :content]


  def self.text_search(query)
    if query.present?
      search_by_tsearch_but_rank_by_trigram(query)
    else
      where(nil)
    end
  end
end




