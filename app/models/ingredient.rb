class Ingredient < ApplicationRecord

  def archive
    self.update(archived: true);
  end
end
