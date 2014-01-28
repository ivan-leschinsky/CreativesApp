class Picture < ActiveRecord::Base
  mount_uploader :file, FileUploader
  belongs_to :creative, :inverse_of => :pictures
  
  def to_jq_upload
    {
      "name" => read_attribute(:file),
      "size" => file.size,
      "url" => file.url,
      "delete_url" => "/creatives/#{creative_id}/pictures/#{id}",
      "delete_type" => "DELETE"
    }
  end
  def to_jq_download
    {
      "name" => read_attribute(:file),
      "size" => file.size,
      "url" => file.url,
      "thumbnail_url" => file.thumb.url,
      "delete_url" => "/creatives/#{creative_id}/pictures/#{id}",
      "delete_type" => "DELETE"
    }
  end
end
