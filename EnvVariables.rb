# # Shibboleth Chef recipe (Common variables e)
# NOTE:  Has to be .rb so require_relative function can call it in the child files

# Notes:
# CF stack creates the SSM parameters and stores them in SSM Param store
# Some plain command / grep params too
# The search and replace previously performed by shibboleth-configurer.sh is now done here (Problems when called by Chef)

# SSM Param lookups
SHIBENV = `aws ssm get-parameters --names shibboleth-chef-Environment --region eu-west-1  | grep Value | awk -F '"' '{print $4}' | tr -d '\n'`
HOSTEDZONE = `aws ssm get-parameters --names shibboleth-chef-HostedZone --region eu-west-1  | grep Value | awk -F '"' '{print $4}' | tr -d '\n'`
LAMBDAPRINCIPALARN = `aws ssm get-parameters --names shibboleth-chef-LambdaPrincipalARN --region eu-west-1  | grep Value | awk -F '"' '{print $4}' | tr -d '\n'`
S3BUCKETNAME = `aws ssm get-parameters --names shibboleth-chef-S3TemplateBucketName --region eu-west-1  | grep Value | awk -F '"' '{print $4}' | tr -d '\n'`
CESACCOUNTID = `aws ssm get-parameters --names shibboleth-chef-CESaccountID --region eu-west-1  | grep Value | awk -F '"' '{print $4}' | tr -d '\n'`
APISAMLAUTHURL = `aws ssm get-parameters --names shibboleth-chef-ApiSAMLAuthUrl --region eu-west-1  | grep Value | awk -F '"' '{print $4}' | tr -d '\n'`
ATYPONINTERNALLOADBALANCER = `aws ssm get-parameters --names shibboleth-chef-AtyponInternalLoadBalancer --region eu-west-1  | grep Value | awk -F '"' '{print $4}' | tr -d '\n'`
RDSMASTERUSER = `aws ssm get-parameters --names shibboleth-chef-RDSMasterUser --region eu-west-1  | grep Value | awk -F '"' '{print $4}' | tr -d '\n'`
RDSMASTERPASSWORD = `aws ssm get-parameters --names shibboleth-chef-RDSMasterPassword --region eu-west-1  | grep Value | awk -F '"' '{print $4}' | tr -d '\n'`
REGION = `aws ssm get-parameters --names shibboleth-chef-Region --region eu-west-1  | grep Value | awk -F '"' '{print $4}' | tr -d '\n'`
STACKNAME = `aws ssm get-parameters --names shibboleth-chef-StackName --region eu-west-1  | grep Value | awk -F '"' '{print $4}' | tr -d '\n'`
SHIBBOLETHLOGENTRIES = `aws ssm get-parameters --names shibboleth-chef-AtyponInternalLoadBalancer --region eu-west-1  | grep Value | awk -F '"' '{print $4}' | tr -d '\n'`
CESHOSTEDZONE = `aws ssm get-parameters --names shibboleth-chef-CESHostedZone --region eu-west-1  | grep Value | awk -F '"' '{print $4}' | tr -d '\n'`

# Non SSM params
CSEDATYPONINTERNALLBDNSURL = "rightsuite-int-elb.#{SHIBENV}.#{HOSTEDZONE}"
SHIBBOLETHPUBLICKEY = `cat /usr/share/tomcat8/keypair/PublicKey`

# Former replacements by shibboleth-configurer.sh script
ERIGHTSCONNUSERNAME = `grep ERIGHTSCONNUSERNAME /root/EnvVariables.properties | awk -F'=' '{print $2}' | sed -s 's/"//g' |  tr -d '\n'`
ERIGHTSCONNPASSWD = `grep ERIGHTSCONNPASSWD /root/EnvVariables.properties | awk -F'=' '{print $2}' | sed -s 's/"//g' |  tr -d '\n'`
ERIGHTSCONNMIN = `grep ERIGHTSCONNMIN /root/EnvVariables.properties | awk -F'=' '{print $2}' | sed -s 's/"//g' |  tr -d '\n'`
ERIGHTSCONNMAX = `grep ERIGHTSCONNMAX /root/EnvVariables.properties | awk -F'=' '{print $2}' | sed -s 's/"//g' |  tr -d '\n'`
EACDBNAME = `grep EACDBNAME /root/EnvVariables.properties | awk -F'=' '{print $2}' | sed -s 's/"//g' |  tr -d '\n'`
OLBHOSTEDZONE = `grep OLBHOSTEDZONE /root/EnvVariables.properties | awk -F'=' '{print $2}' | sed -s 's/"//g' |  tr -d '\n'`