class Reminder < ActiveRecord::Base
	belongs_to :member
	validates :title, presence: true
	validates :date_notify, presence: true
	validates :description, presence: true
end
