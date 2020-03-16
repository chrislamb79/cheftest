#Create an app pool
iis_pool 'my_app_pool' do
    runtime_version "4.0"
    pipeline_mode :Integrated
    action :add
  end
  # create and start a new site that maps to
  # the physical location C:inetpubwwwrootmysite
  # and uses the 'my_app_pool' application pool
  iis_site 'My Site' do
    application_pool "my_app_pool"
    protocol :http
    port 80
    path "#{node['iis']['docroot']}/mysite"
    action [:add,:start]
  end