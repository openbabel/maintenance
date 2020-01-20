import prefixtree as pt
from element_data import elements

lookup = {}
for atomicnum, symbol, name in elements:
    lookup[symbol] = (atomicnum, name)
lookup["D"] = (1, "Deuterium")
lookup["T"] = (1, "Tritium")

def handleElement(symbol, ind):
    symbol = symbol[0].upper() + symbol[1:-1]
    text = pt.Text()
    atomicnum, name = lookup[symbol]
    text.add("return %d; // %s" % (atomicnum, name), ind)
    return text

if __name__ == "__main__":
    tree = pt.Tree(handleElement)
    for _, symbol, _ in elements:
        tree.add(symbol + "\0")
        tree.add(symbol.lower() + "\0")
    tree.add("D\0")
    tree.add("T\0")
    with open("elements.txt", "w") as out:
        out.write(tree.convert(verbose=True))
