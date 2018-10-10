#Verificación de un paquete instalado
control "Control-01" do                                
	impact 1.0                                          
	title "packages is installing"                                 
	desc "packages is installing"
	describe package('unzip') do
	  it { should be_installed }
	end
	describe package('zip') do
	  it { should be_installed }
	end
	describe package('rsync') do
	  it { should be_installed }
	end
  end
  
  #Verificación de existencia de usuario
  control "Control-02" do
	impact 1.0                                          
	title "exists user wso2"                                 
	desc "exists user wso2"  
	describe passwd do
	its('users') { should include 'wso2' }
	end
  end

#Verificación de existencia de grupo--------------------------------------------
control "Control-03" do
	impact 1.0                                          
	title "exists group wso2"                                 
	desc "exists group wso2"  
	describe group('wso2') do
		it { should exist }
		its('gid') { should be > 0 }
	  end
  end

#Verificación de existencia de grupo 2-------------------------------------------
control "Control-03-2" do
	impact 1.0                                          
	title "exists group wso2"                                 
	desc "exists group wso2"  
	describe etc_group.where(item: 'group_name') do
		its('groups') { should include 'wso2' }
	  end
  end

#Verificación de la carpeta wso2am en /opt/
control "Control-04" do
	impact 1.0                                          
	title "exists wso2am folder in /opt/"                                 
	desc "exists wso2am folder in /opt/"  
	describe file('/opt/wso2am') do
		its('type') { should eq :directory }
		it { should be_directory }
	   end
  end


#Verificación del servicio wso2am
control "Control-07" do
	impact 1.0                                          
	title "wso2am service is running"                                
	desc "wso2am service is running" 
	describe service('wso2am') do
		it { should be_installed }
		it { should be_enabled }
		it { should be_running }
	end
end

#Comprobación de propietario
control "Control-08" do
	impact 1.0
	title "wso2 owns everything in /opt/wso2am"
	desc "wso2 owns everything in /opt/wso2am"
	describe bash('find /opt/wso2am \! -user wso2 -print | wc -l') do
		its('stdout') { should cmp 0 }	
	end	
end

#Verificación de que el usuario ejecutar /opt/wso2am/wso2am-2.5.0/bin/wso2server.sh sin contraseña
control "Control-11" do
	impact 1.0                                          
	title "wso2 can runs wso2server.sh"                                 
	desc "wso2 can runs wso2server.sh"                                 
	describe bash("export JAVA_HOME='/usr/java/default' ; /opt/wso2am/current/bin/wso2server.sh start") do
	  its('stderr') { should eq '' }
	end
 end