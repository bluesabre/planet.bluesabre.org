import os
import shutil
import subprocess
import sys

def fetch_feed():
    print("Fetching feed...")
    mailman = shutil.which("mailman-rss")
    if mailman is None:
        localpath = os.path.expanduser("~/.local/bin/mailman-rss")
        if os.path.exists(localpath):
            mailman = localpath
    if mailman is not None:
        print("Using %s to fetch feed" % mailman)
        with open('xfce-announce.xml', "w") as outfile:
            subprocess.run([mailman, "--archive-url", "https://mail.xfce.org/pipermail/xfce-announce/", "--max-items", "10"], stdout=outfile)
    pass

def read_post_head(filename):
    contents = {}
    with open(filename, 'r') as infile:
        started = False
        for line in infile.readlines():
            line = line.strip()
            if line == "---":
                if started:
                    break
                started = True
                continue
            try:
                key, content = line.split(": ", 2)
                contents[key] = content
            except:
                pass
    return contents

def read_post_body(filename):
    head_contents = ""
    contents = ""
    with open(filename, 'r') as infile:
        started = False
        starts_next = False
        head_count = 0
        for line in infile.readlines():
            if head_count < 2:
                if line.strip() == "---":
                    head_count += 1
                head_contents += line
                continue
            if not started and "Release notes for" in line:
                starts_next = True
                continue
            if starts_next:
                started = True
                starts_next = False
                continue
            if started:
                contents += line
        if not started:
            return False
    contents = contents.strip()
    return head_contents + contents

def get_posts():
    posts = []
    for filename in os.listdir("_posts"):
        if filename.endswith(".md"):
            continue
        filename = os.path.join("_posts", filename)
        head = read_post_head(filename)
        try:
            if head["author"] == "Xfce Announcements":
                posts.append(filename)
        except:
            pass
    return posts

def clean_posts():
    print("Cleaning posts...")
    for filename in get_posts():
        print("- %s" % filename)
        new_contents = read_post_body(filename)
        if new_contents:
            with open(filename, "w") as outfile:
                outfile.write(new_contents)
            os.rename(filename, filename.replace(".html", ".md"))

cmd = sys.argv[1]

if cmd == "--fetch":
    fetch_feed()

elif cmd == "--clean":
    clean_posts()