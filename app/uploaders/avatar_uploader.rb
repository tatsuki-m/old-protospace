# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  #リサイズ・画像形式を変更
  include CarrierWave::RMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  #画像の上限サイズの決定
  process resize_to_limit: [700, 700]
  #保存形式をJPG
  process convert: 'jpg'
  #サムネイルを生成する設定
  version :thumb do
    process resize_to_fit: [300, 300]
  end

  #以下のファイル形式受のみけ付ける
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  #ファイルの名前変更
  def filename
    "#{DateTime.now.strftime("%Y%m%d%H%M%S")}.jpg" if original_filename.present?
  end

end
