#!/bin/bash

terraform apply

fab -f fabfile.py --skip-bad-hosts -D --abort-on-prompts wait test
