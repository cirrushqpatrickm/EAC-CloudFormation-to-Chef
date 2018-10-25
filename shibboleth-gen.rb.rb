# Shibboleth Chef cookbook (shibboleth_gen.rb)

pwd = '/home/ec2-user/'

execute 'get_the_files' do
    command "chef-solo -c solo.rb #{pwd}get_configs.rb"
    ignore_failure false
end

execute 'run_the_commands' do
   command "chef-solo -c solo.rb #{pwd}commands.rb"
    ignore_failure false
end

