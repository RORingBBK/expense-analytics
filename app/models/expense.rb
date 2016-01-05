class Expense < ActiveRecord::Base
	belongs_to :member

	validates :title, presence: true
	validates :description, presence: true
	validates :amount, presence: true
	validates :date, presence: true
end
