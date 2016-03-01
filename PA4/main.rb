load 'cltypedef.rb'

require 'set'

def getParentMap(ast)
  parent = {}
  ast.getClasses.each do |c|
    parent[c.name.name] = c.inherit
  end
  parent
end

def checkInheritCycle(pmap)
  visited = Set.new
  pmap.each do |c,_|

    # Skip this class if we've already seen it
    if visited.include? c
      next
    end

    visited.add c
    
    # Done if no parent classe
    if pmap[c].nil?
      next
    end

    n = pmap[c]
    
    # Follow super class chain to end, loop, or already visited class
    while not n.nil? and n.name!=c and not visited.include? n.name do
      visited.add n.name
      n = pmap[n.name]
    end
    
    if not n.nil? and n.name == c
      return true
    end
  end

  false

end

def getAttributes(c, pmap, ast)
  res = []
  parent = pmap[c.name.name]
  if not parent.nil?
    res = res + getAttributes(parent, pmap)
  end
  "something"
end


if __FILE__ == $0
  ast = AST.new
  
  intxt = File.read(ARGV[0])
  ast.load(intxt.split(/\r?\n/).each)
  pmap = getParentMap(ast)
  puts pmap
  puts checkInheritCycle(pmap)
end
