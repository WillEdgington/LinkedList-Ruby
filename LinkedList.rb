class Node
  attr_accessor :next 
  attr_reader :val
  def initialize(num=0,nxt=nil)
    @val=num
    @next=nxt
  end

  def to_s
    @val.to_s
  end
end

# Singly linked list class
class LinkedList
  def initialize
    @root=Node.new() # need a root node for the front of the list
    @tail=@root # set the tail of the list to the root
    @size=0 # set size of list to 0
  end

  def append(val)
    @tail.next=Node.new(val) # set tail.next to the new Node instance that has val=val
    @size+=1 # increase size
    @tail=@tail.next # move tail pointer to the newly appended node (the new tail)
  end

  def prepend(val)
    node=Node.new(val,nxt=@root.next) # create node instance that has val=val and nxt=head (root.next)
    @root.next=node # set root.next to this new node
    @size+=1 # increase size
  end

  def size
    @size
  end

  def head
    if @root.next.nil?
      return nil # empty list so return nil
    end
    @root.next # head of list is node next after root node
  end

  def tail
    @tail
  end

  def at(idx)
    return nil if idx>=size # if index is out of range then return nil

    node=@root
    (0..idx).each do
      node=node.next # traverse through list until at index idx
    end
    node
  end

  def pop
    node=@root

    # traverse to node in list that connects to tail (node.next==tail)
    until node.next==@tail
      node=node.next
    end

    popped=@tail # get tail (this is for returning later)
    @tail=node # set tail to the node before current tail
    @tail.next=nil # set next node after tail to nil (disconnect/pop old tail from list)
    @size-=1 # decrease size
    popped # return popped node
  end

  def contains?(val)
    node=@root.next
    # Traverse the whole list
    until node==@tail.next
      return true if node.val==val # if we find the searched val in list then return true
      node = node.next # move node pointer
    end
    false # whole list traversed without finding val so return false
  end

  def find(val)
    idx=0
    node=@root.next
    # Traverse list until index is out of bounds
    until idx==@size
      return idx if node.val==val # found val so return idx
      node=node.next
      idx+=1
    end
    nil
  end

  def to_s
    node=@root.next
    listStr=""

    # Traverse the whole list
    until node==@tail.next
      listStr+="( #{node} ) -> " # add print of current node to string
      node=node.next
    end
    listStr+="nil" # add nil to end and return
  end

  def insert_at(val,idx)
    prev=at(idx-1) # get previous node (node at index=idx-1)
    return nil if prev==nil # idx out of range
    nxt=prev.next # get node currently at idx (prev.next)
    node=Node.new(val,nxt) # create new node instance with val=val and nxt=nxt
    prev.next=node # set prev.next to node
    @size+=1 # increase size
    node # return new node
  end

  def remove_at(idx)
    prev=at(idx-1) # get previous node (node at index=idx-1)
    return nil if prev==nil # idx out of range 
    nxt=prev.next.next # get node next in the list after the one we want to delete (index=idx+1)
    node=prev.next # get node that we will delete
    node.next=nil # set node.next to nil (not necessary just neater for the return)
    prev.next=nxt # set prev.next to nxt (essentially taking node out of list / deleting node)
    @size-=1 # decrease size
    node # return deleted node
  end
end


# Testcases
ll=LinkedList.new
ll.append(1)
ll.prepend("2")
ll.append("fjfi")
ll.prepend(33)
ll.append([3,3])
ll.prepend(:ff)
puts "head: #{ll.head}"
puts "tail: #{ll.tail}"
puts "size: #{ll.size}"
puts "at index 4: #{ll.at(4)}"
puts "popped val: #{ll.pop}"
puts "popped val: #{ll.pop}"
puts "size: #{ll.size}"
puts "at index 4: #{ll.at(4)}"
ll.append(22)
ll.append(3.1415)
ll.append({a: 2, b: 43})
puts "contains 3.1415?: #{ll.contains?(3.1415)}"
puts "tail: #{ll.tail}"
puts "find 22: #{ll.find(22)}"
puts "Full linked list: #{ll.to_s}"
puts ll
puts "insert 'hello' at index 3: #{ll.insert_at("hello",3)}"
puts "insert 43 at index 0: #{ll.insert_at(43,0)}"
puts ll
puts "size: #{ll.size}"
puts "remove node at index 4: #{ll.remove_at(4)}"
puts ll
puts "size: #{ll.size}"

puts "\nSHUFFLE THE LIST!!:\n--------------------------------------------------------------------------------------------"
(0..ll.size-1).each do
  ll.prepend(ll.pop.val)
  puts ll
end