# Shibboleth CF to chef recipe (Get config files from S3)

require_relative 'EnvVariables'

# Get config files
execute 'get_idp.properties' do
  command "aws s3 cp s3://#{S3BUCKETNAME}/configs/idp.properties /opt/shibboleth-idp/conf/"
   end
  file '/opt/shibboleth-idp/conf/idp.properties' do
    mode '0600'
    owner 'tomcat'
    group 'tomcat'
    action 'create_if_missing'
end
  
execute 'get_attribute-resolver.xml' do
    command "aws s3 cp s3://#{S3BUCKETNAME}/configs/attribute-resolver.xml /opt/shibboleth-idp/conf/"
   end
  file '/opt/shibboleth-idp/conf/attribute-resolver.xml' do
    mode '0600'
     owner 'tomcat'
     group 'tomcat'
     action 'create_if_missing'
 end

execute 'get_EnvVariables.properties' do
    command "aws s3 cp s3://#{S3BUCKETNAME}/configs/EnvVariables.properties /root/EnvVariables.properties"
   end
 file '/root/EnvVariables.properties' do
  mode '0664'
   owner 'root'
   group 'root'
   action 'create_if_missing'
end

# No longer required as commands.rb does this task.
execute 'get_shibboleth-configurer.sh' do
    command "aws s3 cp s3://#{S3BUCKETNAME}/configs/shibboleth-configurer.sh /root/shibboleth-configurer.sh"
   end
 file '/root/shibboleth-configurer.sh' do
  mode '0755'
   owner 'root'
   group 'root'
   action 'create_if_missing'
end

# AmazonCloudWatchAgent.zip
remote_file "/tmp/AmazonCloudWatchAgent/AmazonCloudWatchAgent.zip" do
    source "https://s3.amazonaws.com/amazoncloudwatch-agent/linux/amd64/latest/AmazonCloudWatchAgent.zip"
    mode '0755'
    owner 'root'
    group 'root'
 end

execute 'get_config.json' do
    command "aws s3 cp s3://#{S3BUCKETNAME}/configs/cw-monitor-config.json /opt/cwagent/config.json"
   end
   file '/opt/cwagent/config.json' do
    mode '0644'
     owner 'root'
     group 'root'
     action 'create_if_missing'
  end

execute 'get_CES.xml' do
    command "aws s3 cp s3://#{S3BUCKETNAME}/configs/CES.xml /opt/shibboleth-idp/metadata/CES.xml"
   end
   file '/opt/shibboleth-idp/metadata/CES.xml' do
    mode '0600'
     owner 'tomcat'
     group 'tomcat'
     action 'create_if_missing'
  end

execute 'get_OLB.xml' do
    command "aws s3 cp s3://#{S3BUCKETNAME}/configs/OLB.xml /opt/shibboleth-idp/metadata/OLB.xml"
   end
   file '/opt/shibboleth-idp/metadata/OLB.xml' do
    mode '0600'
     owner 'tomcat'
     group 'tomcat'
     action 'create_if_missing'
  end

execute 'get_OLB_MOBILE.xml' do
    command "aws s3 cp s3://#{S3BUCKETNAME}/configs/MOBILE.xml /opt/shibboleth-idp/metadata/OLB_MOBILE.xml"
   end
   file '/opt/shibboleth-idp/metadata/OLB_MOBILE.xml' do
    mode '0600'
     owner 'tomcat'
     group 'tomcat'
     action 'create_if_missing'
  end

execute 'get_ORB.xml' do
    command "aws s3 cp s3://#{S3BUCKETNAME}/configs/ORB.xml /opt/shibboleth-idp/metadata/ORB.xml"
   end
   file '/opt/shibboleth-idp/metadata/ORB.xml' do
    mode '0600'
     owner 'tomcat'
     group 'tomcat'
     action 'create_if_missing'
  end

execute 'get_ORB_MOBILE.xml' do
    command "aws s3 cp s3://#{S3BUCKETNAME}/configs/ORB.xml /opt/shibboleth-idp/metadata/ORB_MOBILE.xml"
   end
   file '/opt/shibboleth-idp/metadata/ORB_MOBILE.xml' do
    mode '0600'
     owner 'tomcat'
     group 'tomcat'
     action 'create_if_missing'
  end

execute 'get_configure.sh' do
    command "aws s3 cp s3://#{S3BUCKETNAME}/configs/shibboleth-le-configure.sh /opt/logentries/configure.sh"
   end
   file '/opt/logentries/configure.sh' do
    mode '0755'
     owner 'root'
     group 'root'
     action 'create_if_missing'
  end

execute 'get_erightsConnection.properties' do
    command "aws s3 cp s3://#{S3BUCKETNAME}/configs/erightsConnection.properties /opt/shibboleth-idp/edit-webapp/erightsConnection.properties"
   end
   file '/opt/shibboleth-idp/edit-webapp/erightsConnection.properties' do
    mode '0600'
     owner 'tomcat'
     group 'tomcat'
     action 'create_if_missing'
  end

execute 'get_messages.properties' do
    command "aws s3 cp s3://#{S3BUCKETNAME}/configs/messages.properties /opt/shibboleth-idp/messages/messages.properties"
   end
   file '/opt/shibboleth-idp/messages/messages.properties' do
    mode '0644'
     owner 'root'
     group 'root'
     action 'create_if_missing'
  end
