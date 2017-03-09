class Flash
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :body

  validates :body, :presence => true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def self.flashmessage(message)
    MessageBroadcastJob.perform_now(message)
  end

  def persisted?
    false
  end

end
