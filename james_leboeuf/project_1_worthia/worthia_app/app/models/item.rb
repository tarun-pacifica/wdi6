# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  content    :text
#  image      :text
#  created_at :datetime
#  updated_at :datetime
#

class Item < ActiveRecord::Base
  belongs_to :user
  has_many :users, :through => :prices
  has_many :prices, :dependent => :destroy

  accepts_nested_attributes_for :prices, allow_destroy: true

  include PgSearch
  pg_search_scope :search_by_tsearch_but_rank_by_trigram, against: [:name, :content], using: {tsearch: {dictionary: "english"}}, ignoring: :accents

  # :search, against: [:name, :content]
  # where(nil) => Displays all results from the database

  def self.text_search(query)
    if query.present?
      search_by_tsearch_but_rank_by_trigram(query)
    else
      []
    end
  end

  # def self.average()


end




