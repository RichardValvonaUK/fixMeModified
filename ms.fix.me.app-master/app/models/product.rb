class Product < ActiveRecord::Base
  attr_accessible :description, :meta_description, :meta_keywords, :name, :published_status, :strapline, :subcode, :url_segment

  has_many :variants

  has_and_belongs_to_many :categories
  
  acts_as_publishable

  def self.random_best_sellers(number)
  	find(:all, :joins=> "INNER JOIN categories_products ON products.id = categories_products.product_id", :limit => number, :order => 'categories_products.category_id ASC')
  end
end
