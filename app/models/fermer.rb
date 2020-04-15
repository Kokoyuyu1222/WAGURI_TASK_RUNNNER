class Fermer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        has_many :book_marks, dependent: :destroy
        has_many :consumers, through: :book_marks

        has_many :columns, dependent: :destroy
        has_many :products, dependent: :destroy
        has_many :fermer_reviews, dependent: :destroy

         enum withdraw: { draft: false, published: true }

        def book_marked_by?(consumer)
          book_marks.where(consumer_id: consumer.id).exists?
        end


include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end

