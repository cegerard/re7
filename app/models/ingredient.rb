class Ingredient < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  def archive
    self.update(archived: true);
  end

  def unarchive
    self.update(archived: false);
  end
end
