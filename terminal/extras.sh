#!/usr/bin/env bash

# Back up blog data
BACKUP_BLOG_PATH=/var/www/ribachenko.com
function backup_blog {
	ssh salen@139.162.177.188:$BACKUP_BLOG_PATH
	
}
