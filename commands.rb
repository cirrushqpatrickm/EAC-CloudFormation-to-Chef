# Shibboleth Chef recipe (Commands and file edits)

require_relative 'EnvVariables'

# Define the search and replace function, to which the various commands will pass variables
def replace_string(str_to_replace,file_to_edit,envVar)
    # load the file as a string
     data = File.read("#{file_to_edit}")
    # globally substitute
     filtered_data = data.gsub("#{str_to_replace}", "#{envVar}")
    # open the file for writing
     File.open("#{file_to_edit}", "w") do |f|
      f.write(filtered_data)
    end
   end

# Commands
#Get and install AWS SSM agent
execute 'AAinstallSSMAgent' do
    command 'mkdir -p /tmp/ssm'
    command 'cd /tmp/ssm'
    command 'sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm'
    ignore_failure true
     end

# Replace strings in erightsConnection.properties
    #Set vars
     str_to_replace = "|AWSACCOUNT|"
     envVar = CESACCOUNTID
     file_to_edit = "/opt/shibboleth-idp/edit-webapp/erightsConnection.properties"
    # Now run the replace def 
    replace_string(str_to_replace,file_to_edit,envVar)

# Other replacements
    str_to_replace = "|LAMBDAPRINCIPALARN|"
    envVar = LAMBDAPRINCIPALARN
    file_to_edit = "/opt/shibboleth-idp/edit-webapp/erightsConnection.properties"
   replace_string(str_to_replace,file_to_edit,envVar)

    str_to_replace = "|APICESURL|"
    envVar = APISAMLAUTHURL
    file_to_edit = "/opt/shibboleth-idp/metadata/CES.xml"
   replace_string(str_to_replace,file_to_edit,envVar)		  

    str_to_replace = "|APICESURL|"
    envVar = APISAMLAUTHURL
    file_to_edit = "/opt/shibboleth-idp/metadata/OLB.xml"
   replace_string(str_to_replace,file_to_edit,envVar)	

    str_to_replace = "|APICESURL|"
    envVar = APISAMLAUTHURL
    file_to_edit = "/opt/shibboleth-idp/metadata/ORB.xml"
   replace_string(str_to_replace,file_to_edit,envVar)	

    str_to_replace = "|APICESURL|"
    envVar = APISAMLAUTHURL
    file_to_edit = "/opt/shibboleth-idp/metadata/OLB_MOBILE.xml"
   replace_string(str_to_replace,file_to_edit,envVar)	

    str_to_replace = "|APICESURL|"
    envVar = APISAMLAUTHURL
    file_to_edit = "/opt/shibboleth-idp/metadata/ORB_MOBILE.xml"
   replace_string(str_to_replace,file_to_edit,envVar)	

    str_to_replace = "|INTERNALATYPONLBURL|"
    envVar = ATYPONINTERNALLOADBALANCER
    file_to_edit = "/opt/shibboleth-idp/edit-webapp/erightsConnection.properties"
   replace_string(str_to_replace,file_to_edit,envVar)	

    str_to_replace = "|INTERNALATYPONLBDNSURL|"
    envVar = CSEDATYPONINTERNALLBDNSURL
    file_to_edit = "/opt/shibboleth-idp/edit-webapp/erightsConnection.properties"
   replace_string(str_to_replace,file_to_edit,envVar)	   
   
    str_to_replace = "|ENVIRONMENT|"
    envVar = SHIBENV
    file_to_edit = "/opt/shibboleth-idp/conf/idp.properties"
   replace_string(str_to_replace,file_to_edit,envVar)	     
   
    str_to_replace = "|DOMAIN|"
    envVar = HOSTEDZONE
    file_to_edit = "/opt/shibboleth-idp/conf/idp.properties"
   replace_string(str_to_replace,file_to_edit,envVar)	  
   
    str_to_replace = "|DBUSER|"
    envVar = RDSMASTERUSER
    file_to_edit = "/opt/shibboleth-idp/conf/idp.properties"
   replace_string(str_to_replace,file_to_edit,envVar)	    
   
    str_to_replace = "|DBPASSWD|"
    envVar = RDSMASTERPASSWORD
    file_to_edit = "/opt/shibboleth-idp/conf/idp.properties"
   replace_string(str_to_replace,file_to_edit,envVar)	    
   
# Shell commands
# Create KeyPair Dir
execute 'DAcreatekeypairdirs' do
    command 'mkdir -p /usr/share/tomcat8/keypair'
    ignore_failure false
     end

# Install CloudWatch agent, UNZIP FAILS AND NO IDEA WHY!!!
execute 'installCWAgent' do
    command 'cd /tmp/AmazonCloudWatchAgent'
    command 'sudo unzip -o AmazonCloudWatchAgent.zip'
    # There is a typo in the install script.  It has no idea where the detect script is so the following command will fix this
    command "sudo sed -i '/set -u/a cd /tmp/AmazonCloudWatchAgent' /tmp/AmazonCloudWatchAgent/install.sh"
    command 'sudo chmod 755 /tmp/AmazonCloudWatchAgent/detect-system.sh'
    command 'sudo /bin/bash /tmp/AmazonCloudWatchAgent/install.sh'
    ignore_failure true
    end

# No longer required now (Run shibboleth-configurer), plus its problematic with Chef!!
#execute 'shibboleth-configurer' do
#    command '/bin/bash /root/shibboleth-configurer.sh'
#    ignore_failure false
#    end

# erightsConnection stringreplacement
    str_to_replace = "|ERIGHTSCONNUSERNAME|"
    envVar = ERIGHTSCONNUSERNAME
    file_to_edit = "/opt/shibboleth-idp/edit-webapp/erightsConnection.properties"
   replace_string(str_to_replace,file_to_edit,envVar)  

    str_to_replace = "|ERIGHTSCONNPASSWD|"
    envVar = ERIGHTSCONNPASSWD
    file_to_edit = "/opt/shibboleth-idp/edit-webapp/erightsConnection.properties"
   replace_string(str_to_replace,file_to_edit,envVar)

    str_to_replace = "|ERIGHTSCONNMIN|"
    envVar = ERIGHTSCONNMIN
    file_to_edit = "/opt/shibboleth-idp/edit-webapp/erightsConnection.properties"
   replace_string(str_to_replace,file_to_edit,envVar)

    str_to_replace = "|ERIGHTSCONNMAX|"
    envVar = ERIGHTSCONNMAX
    file_to_edit = "/opt/shibboleth-idp/edit-webapp/erightsConnection.properties"
   replace_string(str_to_replace,file_to_edit,envVar)

    str_to_replace = "|EACDBNAME|"
    envVar = EACDBNAME
    file_to_edit = "/opt/shibboleth-idp/conf/idp.properties"
   replace_string(str_to_replace,file_to_edit,envVar)

    str_to_replace = "|OLBHostedZone|"
    envVar = OLBHOSTEDZONE
    file_to_edit = "/opt/shibboleth-idp/messages/messages.properties"
   replace_string(str_to_replace,file_to_edit,envVar)


# Run shibboleth build
execute 'shibboleth-build' do
    command '/bin/bash /opt/shibboleth-idp/bin/build.sh -Didp.target.dir=/opt/shibboleth-idp'
    ignore_failure false
    end

# Get private key    
execute 'CopyPrivateKey' do
    command "aws s3 cp s3://#{S3BUCKETNAME}/configs/PrivateKey /usr/share/tomcat8/keypair/PrivateKey"
    ignore_failure false
    end
    file '/usr/share/tomcat8/keypair/PrivateKey' do
        mode '0664'
        owner 'tomcat'
        group 'tomcat'
        action 'create_if_missing'
      end

execute 'CopyPublicKey' do
    command "aws s3 cp s3://#{S3BUCKETNAME}/configs/PublicKey /usr/share/tomcat8/keypair/PublicKey"
    ignore_failure false
    end
    file '/usr/share/tomcat8/keypair/PublicKey' do
        mode '0664'
        owner 'tomcat'
        group 'tomcat'
        action 'create_if_missing'
      end

# Insert the public key into messages.properties
    str_to_replace = "|SHIBBOLETHPUBLICKEY|"
    envVar = SHIBBOLETHPUBLICKEY
    file_to_edit = "/opt/shibboleth-idp/messages/messages.properties"
    replace_string(str_to_replace,file_to_edit,envVar)	     

# Insert the public key into messages.properties
    str_to_replace = "|CESHostedZone|"
    envVar = CESHOSTEDZONE
    file_to_edit = "/opt/shibboleth-idp/messages/messages.properties"
    replace_string(str_to_replace,file_to_edit,envVar)	 
      


# User data bootstrap. Create file and run it here
open('/home/ec2-user/bootstrap.sh', 'w') { |f|     
    f << "#!/bin/bash -xe\n"
    f << "# Install the files and packages from the metadata\n"
    f << "source /root/.bash_profile\n"
    f << "export HOME=/root\n"
    f << "printenv > /root/cf-init-env\n"
    f << "yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm\n"
    f << "/usr/bin/yum -y install rpl --enablerepo=epel\n"
    f << "/opt/aws/bin/cfn-init -v --stack #{STACKNAME} --resource ShibbolethServer --configsets ConfigureShibbolethServer --region #{REGION}\n"
    f << "#Configure config files based on current environment\n"
    f << "sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/cwagent/config.json -s \n"
    f << "echo `ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}'` `hostname -s` `hostname` >>/etc/hosts\n"
    f << "if [ #{SHIBBOLETHLOGENTRIES} == 'enable' ];then\n"
    f << "  /opt/logentries/configure.sh 'Shibboleth #{SHIBENV}.#{HOSTEDZONE}'\n"
    f << "fi\n"
    f << "#start tomcat\n"
    f << "/usr/sbin/usermod -d /usr/share/tomcat8 tomcat\n"
    f << "/etc/init.d/tomcat8 start\n"
    }   

# Execute the files created above - FAILS TO RUN, MAY NEED CORRECT AMI/ENVIRONMENT
    execute 'bootstrap' do
        command '/bin/bash /home/ec2-user/bootstrap.sh'
        ignore_failure false
        end



