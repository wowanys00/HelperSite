class Work < ApplicationRecord
    belongs_to :user

    mount_uploaders :photos, PhotoUploader
    serialize :photos, JSON
end
