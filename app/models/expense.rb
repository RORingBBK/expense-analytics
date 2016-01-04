class Expense < ActiveRecord::Base
	belongs_to :member

	validates :title, presence: true
	validates :description, presence: true
	validates :amount, presence: true
	validates :date_notify, presence: true
end
