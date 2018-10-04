Role Name
=========

This role get up a instances with the carbon product, wso2 api manager 2.5.0.

That make?
------------

Creates user
Creates group
Downloads wso2 api manager
Unzips zip api manager
Installs java

Requirements
------------
java

Role Variables
--------------

# defaults file for wso2apim-2.5.0

wso2_user: user
wso2_group: group
carbon_base: personal folder
carbon_home: home folder
unzip_folder: temporal folder

# these are the default ports for wso2 products
wso2_default_https_port: 9443
wso2_default_http_port: 9763

#the following is written into the init.d file for the service
java_home: road java

# wso2
wso2_app: product name
wso2_app_version: version
wso2_app_directory: product directory 
wso2_app_offset: 0
wso2_headers: "User-Agent:testuser,Referer:http://connect.wso2.com/wso2/getform/reg/new_product_download"
wso2_apim_url: "http://product-dist.wso2.com/products/api-manager/{{wso2_app_version}}/wso2am-{{wso2_app_version}}.zip"
wso2_app_https_port: "{{ (wso2_default_https_port|int) + (wso2_app_offset|int) }}"
wso2_app_http_port: "{{ (wso2_default_http_port|int) + (wso2_app_offset|int) }}"
wso2_dir_archive: "/home/{{ wso2_user }}"
wso2_app_archive: zip road

Dependencies
------------

- ansible-role-java version:java-1.8.0-openjdk
- https://github.com/geerlingguy/ansible-role-java.git

Example Playbook
----------------

- name : middleware | admin | users

  hosts: all
  become: yes
  roles:
          - ansible-wso2apim
          - ansible-role-java

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
