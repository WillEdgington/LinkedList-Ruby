class Node
  attr_accessor :next 
  attr_reader :val
  def initialize(num=0,nxt=nil)
    @val=num
    @next=nxt
  end
end

class LinkedList
  def initialize
    @root=Node.new()
    @tail=@root
    @size=0
  end

  def append(val)
    @tail.next=Node.new(val)
    @size+=1
    @tail=@tail.next
  end

  def prepend(val)
    node=Node.new(val,nxt=@root.next)
    @root.next=node
    @size+=1
  end

  def size
    @size
  end

  def head
    if @root.next.nil?
      return nil
    end
    @root.next.val
  end

  def tail
    @tail.val
  end

  def at(idx)
    return nil if idx>=size

    node=@root
    (0..idx).each do
      node=node.next
    end
    node.val
  end

  def pop
    node=@root

    until node.next==@tail
      node=node.next
    end

    popVal=@tail.val
    @tail=node
    @size-=1
    popVal
  end

  def contains?(val)
    node=@root.next
    until node==@tail.next
      return true if node.val==val
      node = node.next
    end
    false
  end

  def find(val)
    idx=0
    node=@root.next
    until idx==@size
      return idx if node.val==val
      node=node.next
      idx+=1
    end
    nil
  end

  def to_s
    node=@root.next
    listStr=""

    until node==@tail.next
      listStr+="( #{node.val} ) -> "
      node=node.next
    end
    listStr+="nil"
  end

  def insert_at(val,idx)
  end

  def remove_at(idx)
  end

end

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