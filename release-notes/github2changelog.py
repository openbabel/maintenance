# This Python file uses the following encoding: latin-1
from urllib.request import urlopen, Request
import time
import os


def normalise(text):
    return text.replace("&#39;", "'").replace("&quot;", '"')

def get_data(miter):
    for line in miter:
        if 'data-hovercard-type="pull_request"' in line:
            idx = line.find(">")
            title = line[idx+1:line.find("<", idx)]
            idx = line.find("openbabel/openbabel/pull")
            pr = line[idx+25:line.find('/', idx+25)]
        elif 'data-hovercard-type="user"' in line:
            idx = line.find(">")
            user = line[idx+1:line.find("<", idx)]
            yield normalise(title), pr, user

def download():
    url = "https://github.com/openbabel/openbabel/pulls?page={}&q=is%3Apr+is%3Amerged+sort%3Aupdated-desc+merged%3A%3E2019-10-05"

    for i in range(9):
        # with urllib.request.urlopen(url.format(i+1)) as response:
        with urlopen(Request(url.format(i+1), headers={'User-Agent': 'Mozilla'})) as response:
            html = response.read()
        with open("pr_%d.txt" % i, "wb") as out:
            out.write(html)

missing = { # note: voidpin just prefers not to use his name
           "philthiel": "Philipp Thiel", "fredrikw": "Fredrik Wallner",
           "baoilleach": "Noel O'Boyle", "mwojcikowski": "Maciej Wójcikowski",
           "eloyfelix": "Eloy Felix", "orex": "Kirill Okhotnikov",
           "afonari": "Alexandr Fonari",
           "khoran": "Kevin Horan",
          }

def getName(username):
    if not os.path.isdir("authors"):
        os.mkdir("authors")
    if username in missing:
        return missing[username]
    fname = os.path.join("authors", "%s.html" % username)
    if not os.path.isfile(fname):
        with open(fname, "wb") as out:
            with urlopen('http://github.com/%s' % author) as response:
                html = response.read()
                out.write(html)
            time.sleep(1)

    with open(fname) as inp:
        for line in inp:
            if line.lstrip().startswith("<title>"):
                idx = line.find("<title>")
                name = line[idx+7:line.find("</title>")] 
                idx = name.find("(")
                if idx == -1:
                    return ""
                return name[idx+1:name.find(")", idx)]

if __name__ == "__main__":
    # Delete all of the pr_*.txt files to force a re-download
    if not os.path.isfile("pr_0.txt"):
        print("Downloading HTML pages")
        download()
    else:
        print("Reusing HTML pages")

    authors = set()
    lines = []
    for i in range(9):
        if not os.path.isfile("pr_%d.txt" % i): break
        with open("pr_%d.txt" % i, "r", encoding="utf-8") as inp:
            for title, pr, author in get_data(inp):
                lines.append("* %s (by %s, PR#%s)" % (title, author, pr))
                authors.add(author)

    with open("changes.txt", "w", encoding="utf-8") as out:
        for line in reversed(lines):
            out.write(line + "\n")

    with open("authors.txt", "w", encoding="utf-8") as out:
        names = []
        for author in sorted([x.lower() for x in authors]):
            names.append("%s (%s)" % (author, getName(author)))
        out.write(", ".join(names))
