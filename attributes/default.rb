# Name of the group to create for the tomcat user. This probably should remain default
default[:wsi_tomcat][:group][:name]    = "tomcat"
default[:wsi_tomcat][:user][:name]     = "tomcat"
default[:wsi_tomcat][:user][:home_dir] = "/opt/tomcat"


# Set the version of Tomcat to install
default[:wsi_tomcat][:version]      = "7.0.57"
default[:wsi_tomcat][:version_base] = default[:wsi_tomcat][:version] .split(".")[0]

# Tomcat mirrors. Feel free to add more mirrors as needed. Chef will try to grab from them in order until completed
tomcat_url_fragment                   = "tomcat/tomcat-#{wsi_tomcat.version_base}/v#{wsi_tomcat.version}/bin/apache-tomcat-#{wsi_tomcat.version}.tar.gz"
default[:wsi_tomcat][:file][:archive][:mirrors] = [
  "http://mirror.olnevhost.net/pub/apache/#{tomcat_url_fragment}",
  "http://apache.mirrors.lucidnetworks.net/#{tomcat_url_fragment}",
  "http://www.webhostingreviewjam.com/mirror/apache/#{tomcat_url_fragment}",
  "http://mirror.nexcess.net/apache/#{tomcat_url_fragment}"
]
# Chef will verify the SHA256 checksum of the downloaded archive
# Generate SHA256 checksum for a file:
# http://www.openoffice.org/download/checksums.html#hash_win
# http://www.openoffice.org/download/checksums.html#hash_linux
# http://www.openoffice.org/download/checksums.html#hash_mac
default[:wsi_tomcat][:file][:archive][:checksum] = "1ce390049ed23143e3db0c94781c1e88a4d1b39ceb471c0af088a0c326d637cb"

default[:wsi_tomcat][:instances] = {
  "default" => {
    :port => 8080,
    :ssl => false
  },
  "test"  => {
    :port => 8081,
    :ssl  => true
  }
}
# Tomcat user credentials
default[:wsi_tomcat][:default][:user][:tomcat_admin_pass] = "tomcat_admin"
default[:wsi_tomcat][:default][:user][:tomcat_script_pass] = "tomcat_script"
default[:wsi_tomcat][:default][:user][:tomcat_jmx_pass] = "tomcat_jmx"
default[:wsi_tomcat][:test][:user][:tomcat_admin_pass] = "tomcat_admin"
default[:wsi_tomcat][:test][:user][:tomcat_script_pass] = "tomcat_script"
default[:wsi_tomcat][:test][:user][:tomcat_jmx_pass] = "tomcat_jmx"

default[:wsi_tomcat][:archive][:manager_name] = "manager_war.tar.gz"

# JAVA Installation Options
# https://supermarket.chef.io/cookbooks/java
default[:java][:jdk_version] = "7"
