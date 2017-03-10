class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  after_initialize :init

    def init
      self.admin  ||= false
    end


  def mood
    self.nausea > self.happiness ? "sad" : "happy"
  end

end
