#!/bin/bash

required_php_version=8.2

# Check if PHP 8.2 is installed
php_version=$(php -v | grep -o 'PHP [0-9]\+\.[0-9]\+\.[0-9]\+' | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+')
if [[ -z "$php_version" || $php_version < $required_php_version ]]; then
    echo "PHP 8.2 or later is required. Please install PHP 8.2 or later and try again."
    read -p "Press any key to continue..."
    exit 1
fi

php ./cmd.phar install

exit 1
