if platform?( "redhat", "centos", "fedora" )
  package "apr-devel"
  package "libconfuse-devel"
  package "expat-devel"
  package "rrdtool-devel"
end

remote_file "/usr/src/ganglia-web-#{node[:ganglia][:webversion]}.tar.gz" do
  source node[:ganglia][:weburi]
  checksum node[:ganglia][:webchecksum]
end

web_src_path = "/usr/src/ganglia-web-#{node[:ganglia][:webversion]}"

execute "untar ganglia-web" do
  command "tar xzf ganglia-web-#{node[:ganglia][:webversion]}.tar.gz"
  creates web_src_path
  cwd "/usr/src"
end

