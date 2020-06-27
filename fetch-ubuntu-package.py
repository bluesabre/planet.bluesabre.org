#!/usr/bin/python3

import re
import time
import urllib.request

from bs4 import BeautifulSoup

def md_body(body):
    output = []
    for line in body.split("\n"):
        if len(line.strip()) == 0:
            continue
        if line.lstrip().startswith("["):
            output.append("\n" + line.strip())
            continue
        if line.lstrip().startswith("-") or line.lstrip().startswith("+") or line.lstrip().startswith("*"):
            indent_length = len(line) - len(line.lstrip()) - 2
            indent = ""
            for i in range(indent_length):
                indent += " "
            line = line.strip()
            line = line[1:]
            line = line.strip()
            output.append(indent + "- " + line)
        else:
            if len(output) > 0:
                output[len(output) - 1] += line
            else:
                output.append(line)
    return "\n".join(output)

# ^([A-Za-z0-9\-]+)\s+\((.+)\)\s+([A-Za-z]+);\s+.*$
release_regex = r"^([A-Za-z0-9\-]+)\s+\((.+)\)\s+([A-Za-z]+);\s+.*$"
# 1) Package, 2) Version, 3) Archive

# ^\s--\s(.*)\s<(.*)>\s+(.*)$
author_regex = r"^\s--\s(.*)\s<(.*)>\s+(.*)$"
# 1) Name, 2) Email, 3) Date

def convert_date(date_string):
    # Fri, 06 Apr 2012 21:42:53 +0200
    date_string = date_string.replace("  ", " ")
    date_string = date_string.strip()
    weekday, day, month_string, year, time, offset = date_string.split(" ", 6)
    months = {
        "Jan": "01",
        "Feb": "02",
        "Mar": "03",
        "Apr": "04",
        "May": "05",
        "Jun": "06",
        "Jul": "07",
        "Aug": "08",
        "Sep": "09",
        "Oct": "10",
        "Nov": "11",
        "Dec": "12"
    }
    month = months[month_string]
    return "%s-%s-%s %s.000000000 Z" % (year, month, day, time)

def get_changelog_url_topdir(package_name):
    if package_name.startswith("lib"):
        topdir = package_name[:4]
    else:
        topdir = package_name[0]
    return "http://changelogs.ubuntu.com/changelogs/pool/universe/%s/%s" % (topdir, package_name)

def get_changelog_url(package_name, version):
    topdir = get_changelog_url_topdir(package_name)
    return "%s/%s_%s/changelog" % (topdir, package_name, version)

def process_changelog(contents):
    releases = []
    current_release = None
    for line in contents.split("\n"):
        if current_release is None:
            match = re.search(release_regex, line)
            if match is not None:
                package, version, archive = (match[1], match[2], match[3])
                current_release = "%s (%s) %s" % (package, version, archive)
                original_link = get_changelog_url(package, version)
                body = ""
            continue
        match = re.search(author_regex, line)
        if match is not None:
            name, email, date = (match[1], match[2], match[3])
            date = convert_date(date)
            short_date = date.split(" ")[0]
            filename = "%s-%s_%s_%s.md" % (short_date, package, version, archive)
            releases.append({
                "release": current_release,
                "author": name,
                "email": email,
                "date": date,
                "original_link": original_link,
                "filename": filename,
                "body": md_body(body.rstrip().lstrip("\n"))
            })
            current_release = None
            continue
        body += line + "\n"
    return releases

def get_changelog(package_name):
    #http://changelogs.ubuntu.com/changelogs/pool/universe/l/lightdm-gtk-greeter/
    url = "%s/" % get_changelog_url_topdir(package_name)

    page = urllib.request.urlopen(url)
    content = page.read()

    soup = BeautifulSoup(content, 'lxml') # Parse the HTML as a string

    table = soup.find_all('table')[0] # Grab the first table

    row_idx = 0
    data = {}
    for row in table.find_all('tr'):
        out = {}
        column_marker = 0
        columns = row.find_all('td')
        for column in columns:
            out[column_marker] = column.get_text()
            column_marker += 1
        if len(out.keys()) > 0:
            data = out

    time.sleep(1)

    url += data[1] + "changelog"
    page = urllib.request.urlopen(url)
    content = page.read()

    return content.decode("utf-8")

def get_post(release):
    contents = """---
title: '%s'
created_at: %s
author: %s
layout: post
original_link: %s
excerpt_only: false
---
%s""" % (release["release"], release["date"], release["author"], release["original_link"], release["body"])
    return contents

def get_posts(package_name):
    print("\nGetting posts for package %s..." % package_name)
    time.sleep(5)
    contents = get_changelog(package_name)
    cl = process_changelog(contents)
    release_count = 0
    for release in cl:
        print("- %s" % release["filename"])
        filename = "_posts/%s" % release["filename"]
        file_contents = get_post(release)
        with open(filename, 'w') as outfile:
            outfile.write(file_contents)
        release_count += 1
        if release_count == 1:
            return

packages = [
    "atril",
    "blueman",
    "catfish",
    "elementary-xfce",
    "engrampa",
    "exo",
    "garcon",
    "gigolo",
    "gimp",
    "greybird-gtk-theme",
    "libxfce4ui",
    "libxfce4util",
    "lightdm",
    "lightdm-gtk-greeter",
    "lightdm-gtk-greeter-settings",
    "mate-calc",
    "menulibre",
    "mousepad",
    "mugshot",
    "numix-gtk-theme",
    "parole",
    "pidgin",
    "ristretto",
    "sgt-launcher",
    "sgt-puzzles",
    "shimmer-themes",
    "thunar",
    "thunar-archive-plugin",
    "thunar-dropbox-plugin",
    "thunar-media-tags-plugin",
    "thunar-vcs-plugin",
    "thunar-volman",
    "tumbler",
    "xfburn",
    "xfce4",
    "xfce4-appfinder",
    "xfce4-battery-plugin",
    "xfce4-clipman-plugin",
    "xfce4-cpufreq-plugin",
    "xfce4-cpugraph-plugin",
    "xfce4-datetime-plugin",
    "xfce4-dict",
    "xfce4-diskperf-plugin",
    "xfce4-eyes-plugin",
    "xfce4-fsguard-plugin",
    "xfce4-genmon-plugin",
    "xfce4-goodies",
    "xfce4-indicator-plugin",
    "xfce4-mailwatch-plugin",
    "xfce4-mount-plugin",
    "xfce4-mpc-plugin",
    "xfce4-netload-plugin",
    "xfce4-notes-plugin",
    "xfce4-notifyd",
    "xfce4-panel",
    "xfce4-panel-profiles",
    "xfce4-places-plugin",
    "xfce4-power-manager",
    "xfce4-pulseaudio-plugin",
    "xfce4-screensaver",
    "xfce4-screenshooter",
    "xfce4-sensors-plugin",
    "xfce4-session",
    "xfce4-settings",
    "xfce4-smartbookmark-plugin",
    "xfce4-statusnotifier-plugin",
    "xfce4-systemload-plugin",
    "xfce4-taskmanager",
    "xfce4-terminal",
    "xfce4-time-out-plugin",
    "xfce4-timer-plugin",
    "xfce4-verve-plugin",
    "xfce4-wavelan-plugin",
    "xfce4-weather-plugin",
    "xfce4-whiskermenu-plugin",
    "xfce4-xkb-plugin",
    "xfconf",
    "xfdashboard",
    "xfdesktop4",
    "xfwm4",
    "xiccd",
    "xubuntu-artwork",
    "xubuntu-community-artwork",
    "xubuntu-default-settings",
    "xubuntu-docs",
    "xubuntu-meta"
]

for package_name in packages:
    get_posts(package_name)
