terraform-fabric
================

Using Terraform with Python Fabric on AWS

Problems Solved
--------------------

 - Wait for user account to be created on server before running Fabric tasks.  Terraform doesn't have this feature in it's provisioners.
 
 - Get away from writing Python boto scripts, or bash scripts using CLI tools.
 
 - Manage states of infrastructure with a cloud agnostic approach.
 
 - Sequential tasks for complex deployments, or wait till CM tools like Puppet to finish it's bootstrapping activities.

Fill Out These Files
-----------------------
configurations.py:  (SSH location, login name)

    KEY_FILE = '/Users/marcinot/ssh/default-ssh.pem'
    USERNAME = 'default-ssh'

terraform.tfvars:  (AWS keys)

    access_key = ""
    secret_key = ""
