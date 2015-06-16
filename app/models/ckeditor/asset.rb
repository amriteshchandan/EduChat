class Ckeditor::Asset < ActiveRecord::Base
	has_attached_file :data
  include Ckeditor::Orm::ActiveRecord::AssetBase
  include Ckeditor::Backend::Paperclip
end
