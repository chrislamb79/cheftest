windows_feature "TelnetClient" do
    action :install
  end
  %w{ IIS-WebServerRole IIS-WebServer }.each do |feature|
    windows_feature feature do
      action :install
    end
  end