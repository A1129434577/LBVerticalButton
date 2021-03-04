Pod::Spec.new do |spec|
  spec.name         = "LBVerticalButton"
  spec.version      = "1.0.0"
  spec.summary      = "垂直排列且支持右上角图标的Button"
  spec.description  = "更改系统UIButton的排列规则，改为上下排列模式，图片在上title在下间距自定义，且支持右上角图标。"
  spec.homepage     = "https://github.com/A1129434577/LBVerticalButton"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "刘彬" => "1129434577@qq.com" }
  spec.platform     = :ios
  spec.ios.deployment_target = '8.0'
  spec.source       = { :git => 'https://github.com/A1129434577/LBVerticalButton.git', :tag => spec.version.to_s }
  spec.source_files = "LBVerticalButton/**/*.{h,m}"
  spec.requires_arc = true
end
