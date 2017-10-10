#
#  Be sure to run `pod spec lint SceneKitVideoRecorder.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name = "Times"
  s.version = "1.0.0"
  s.summary = "Control how many times a codeblock gets executed."
  s.description = <<-DESC
  You can easily run a codeblock once (or as many times you want) without having to track the status yourself.
                   DESC
  s.homepage     = "https://github.com/okaris/Times.git"
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { "okaris" => "ok@okaris.com" }
  s.social_media_url = "http://twitter.com/okarisman"
  s.source = { :git => "https://github.com/okaris/Times.git", :tag => "#{s.version}" }
  s.ios.deployment_target = '9.0'
  s.source_files = "Classes/**/*"
  s.exclude_files = "Classes/Exclude"

end
