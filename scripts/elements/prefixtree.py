class Node:
    def __init__(self, letter, name):
        self.letter = letter
        self.name = name
        self.children = []
    def __str__(self):
        if self.children:
            return "Node(%s, %s, %s)" % (self.letter, self.name if self.name else "-", "".join([str(x) for x in self.children]))
        else:
            return "Node(%s, %s)" % (self.letter, self.name)

class Text:
    def __init__(self):
        self.lines = []
    def add(self, line, indent):
        self.lines.append("  "*indent + line)
    def toString(self):
        return "\n".join(self.lines)
    def extend(self, otext):
        self.lines.extend(otext.lines)

def encode(letter):
    if ord(letter) > 127:
        return "\\x" + hex(ord(letter)).upper()[2:]
    if ord(letter) == 0:
        return "\\0"
    if letter == "'":
        return "\\'"
    return letter

def addBrackets(aaname):
    if len(aaname) == 1:
        return aaname
    return "[%s]" % aaname

def trimSlashZero(aaname):
    if ord(aaname[-1]) == 0:
        return aaname[:-1]
    return aaname

class Tree:
    def __init__(self, handler):
        self.root = Node("", "")
        self.handler = handler
    def add(self, name):
        curr = self.root
        for n in name:
            childletters = set(x.letter for x in curr.children)
            if n not in childletters:
                curr.children.append(Node(n, ""))
                curr = curr.children[-1]
            else:
                curr = [x for x in curr.children if x.letter == n][0]

        curr.name = name

    def convert(self, verbose=False):
        ans = Text()
        def traverse(curr, N, ind):
            # Three possibilities:
            # (1) Has one child (2) Has more than one child
            # (3) Is terminal
            if len(curr.children) == 0:
                pass
            elif len(curr.children) == 1:
                tmp = []
                while True:
                    curr = curr.children[0]
                    tmp.append(curr.letter)
                    if curr.name or len(curr.children) != 1:
                        break

                # Invariant: either curr has a name and/or the number
                # of children is not 1
                tmpb = []
                for i, x in enumerate(tmp):
                    tmpb.append("ptr[%d]=='%s'" % (i+N, encode(x)))
                ans.add("if (%s) {" % " && ".join(tmpb), ind)
                if len(curr.children) > 0:
                    traverse( curr, N+len(tmp), ind+1 )
                if curr.name:
                    ans.lines[-1] += " // %s" % trimSlashZero(curr.name)
                    ans.extend(self.handler(curr.name, ind+1))
                ans.add("}", ind)
            else:
                ans.add("switch(ptr[%d]) {" % N, ind)
                for child in sorted(curr.children, key=lambda x:x.letter):
                    ans.add("case '%s':" % encode(child.letter), ind)
                    traverse( child, N+1, ind+1 )
                    if child.name:
                        ans.lines[-1] += " // %s" % trimSlashZero(child.name)
                        ans.extend(self.handler(child.name, ind+1))
                    else:
                        ans.add("break;", ind+1)
                # ans.append("  "*ind+"default:")
                # ans.append("  "*(ind+1)+"break;")
                ans.add("}", ind)

        traverse(self.root, 0, 1)
        return ans.toString()
