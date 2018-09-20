property :name, String, default: '' # ~FC108

action :install do
  include_recipe 'yum-epel' if platform_family?('rhel')

  package %w(haveged gnupg2)

  service 'haveged' do # FIXME: (?) this will create duplicates in case other cookbooks do the same
    supports [:status, :restart]
    action :start
  end
end
