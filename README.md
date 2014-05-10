octopress-random-text
=====================

Random text plugin for Octopress/Jekyll

# Description
This plugin allows you to insert a random line from a text file anywhere in your
template.

# Installation
Copy the plugin files to your Octopress blog. Edit the `random-text.html` file
in `source/_includes/custom/asides` as necessary and add it to your asides list
as `custom/asides/random-text.html`.

# Usage
Use the following to pick the default file from /random-texts.txt

    {% randomtext %}

Use the following to pick a specific file.

    {% randomtext file:/data/quotes %}

You can add the above tag in as many places as you want in your template. It
uses client-side JavaScript to pull a random line from the specified file, so
every page refresh gets a new random line.
