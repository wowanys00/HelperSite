class Work < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    mount_uploaders :photos, PhotoUploader
    serialize :photos, JSON
end
