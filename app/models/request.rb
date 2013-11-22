class Request < ActiveRecord::Base
  has_many :request_items, :dependent => :destroy
  accepts_nested_attributes_for :request_items, :reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? }}, :allow_destroy => true
  belongs_to :user
  
  PRODUCT_LINES = [ "A9", "A7", "AG", "AF", "S3", "Legacy", "K/Kpro", "EMW", "HD", "Non-Metallic" ]
  
  validates :request_number, :description, :product_line, presence: true
  validates :request_number, uniqueness: true
  
  def incrament(request)
    request[:request_number] = Request.maximum(:request_number) + 1
    return request
  end
  
end

