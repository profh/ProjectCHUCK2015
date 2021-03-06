class Location < ActiveRecord::Base

  #Relationships
  has_many :games


  #Validations
  validates_presence_of :name, :street, :city, :zip, :state
  validates_uniqueness_of :name

  #format validations
  validates_format_of :zip, with: /\A\d{5}\z/, message: "should be five digits long"
  us_state_abbrevs = ['AL', 'AK', 'AS', 'AZ', 'AR', 'CA', 'CO', 'CT', '
  	DE', 'DC', 'FM', 'FL', 'GA', 'GU', 'HI', 'ID', 'IL', 'IN', 'IA', 
  	'KS', 'KY', 'LA', 'ME', 'MH', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 
  	'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'MP', 'OH', 
  	'OK', 'OR', 'PW', 'PA', 'PR', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 
  	'VT', 'VI', 'VA', 'WA', 'WV', 'WI', 'WY']
  validates :state, length: {is: 2}, inclusion: {in: us_state_abbrevs}


  #scopes
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :alphabetical, -> { order('name') }
  scope :by_city, -> { order('city') }
  #scope :zip, -> {where( )} -- not terribly sure to write this correctly

  #functions
  def get_city
	  return self.city
  end


end
