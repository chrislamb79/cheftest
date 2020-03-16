Powershell_script 'Install IIS Management Console' do 
    Code 'Add-WindowsFeature Web-Mgmt-Console'
    Guard_interpreter :powershell_script
    Not_if '(Get-WindowsFeature-Name Web-MGMT-Console).Installed'
  end 
  
  Powershell_script 'Install ASP.NET' do 
    code 'Add-WindowsFeature  web-ASP-Net45'
    guard_interpreter :powershell_script
    not_if '(Get-WindowsFeature -Name Web-Server).Installed'
  end  
  
  Powershell_script 'Install IIS Static Content' do 
    code 'Add-WindowsFeature Web-Static-Content' 
    guard_interpreter :powershell_script
    Not_if '(Get-WindowsFeature -Name Web-Static-Content).Installed'
  end 
  
  service 'w3svc' do 
    Action [:start, :enable]
  end 
  
  directory 'C:/inetpub/wwwroot' do
  Recursive true 
  end 
  
  template 'C:/inetpub/wwwroot/index.html' do 
    Source 'index.html.erb'
  end