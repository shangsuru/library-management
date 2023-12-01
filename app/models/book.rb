# frozen_string_literal: true

class Book < ApplicationRecord
  has_one :borrowing, -> { where active: true }
  has_one :borrowing_user, through: :borrowing, source: :user
  belongs_to :category
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :image, presence: true
  def self.ransackable_attributes(auth_object = nil)
    ["author", "isbn", "title", "category_id", "created_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end

  def borrowed?
    borrowing.present?
  end

  def borrowed_by?(user)
    borrowing_user == user
  end

  def reserved?
    false
  end
end
