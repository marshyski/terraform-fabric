#!/usr/bin/python
from fabric.api import sudo, env, put, run
import paramiko
import configuration as config
import sys, os, time
from subprocess import call

if os.stat('hosts_file').st_size == 0:
  print "hosts_file is empty\n"
  sys.exit(1)

env.hosts = open('hosts_file', 'r').readline().rstrip()
env.user = config.USERNAME
env.port = '22'
env.key_filename = config.KEY_FILE
env.warn_only = True
env.connection_attempts = 60

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

def wait():
    while True:
      try:
        ssh.connect(env.hosts, username=env.user, key_filename=env.key_filename)
        break
      except Exception:
        time.sleep(10)

def test():
    run('echo hello')
