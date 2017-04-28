class Resume < ActiveRecord::Base
  belongs_to :user
  belongs_to :job, counter_cache: true

  mount_uploader :attachment, AttachmentUploader

  validates :content, presence: true
end
