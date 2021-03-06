class Drawing < ActiveRecord::Base
	belongs_to :workcategory
  	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	def self.search(params)
  		drawings = Drawing.where("name like ?", "%#{params[:search]}%")
  		drawings
  	end
end
