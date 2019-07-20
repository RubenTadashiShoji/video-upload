class Micropost < ApplicationRecord
    belongs_to :user 
    default_scope->{ order(created_at: :desc)}
    mount_uploader :video, VideoUploader
    validates :user_id, presence: true
    validates :content, length: {maximum:140}, presence: true 
    validate :video_size 
    
    private 
    
    # validates the size on an uploaded video
    def video_size
        if video.size > 10.megabytes
           errors.add(:video, "should be less than 10MB") 
        end
    end
    
end
