# == Schema Information
#
# Table name: beta_emails
#
#  id         :integer          not null, primary key
#  email      :string(255)      default(""), not null
#  created_at :datetime
#  updated_at :datetime
#

class BetaEmail < ActiveRecord::Base
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, presence: true
end
