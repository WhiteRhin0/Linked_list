require 'minitest/autorun'

class Node
  attr_accessor :value, :next

  def initialize(value, next_node)
    @value = value
    @next = next_node
  end
end

class List

  attr_accessor :head

  def initialize(value)
    @head = Node.new(value, nil)
  end

  def add(value)
    current = @head
    while current.next != nil
      current = current.next
    end
    current.next = Node.new(value, nil)
  end

  def get_at(id)
    if @head == nil
      return nil
    else
      current = @head
      id.times do
        current = current.next
      end
    end
    current.value
  end

  def size
    size = 0
    current = @head
    until current == nil
      current = current.next
      size += 1
    end
    size
  end

  def return
    list_of_elements = []
    current = @head
    while current.next != nil
      list_of_elements << current.value
      current = current.next
    end
    list_of_elements << current.value
  end

end

class Test < Minitest::Test
  def setup
    @list = List.new(1)
    @list.add(2)
    @list.add(3)
    @list.add(4)
    @list.add(5)
  end

  def test_size
    assert_equal 5, @list.size
  end

  def test_return
    assert_equal [1, 2, 3, 4, 5], @list.return
  end

  def test_get_at
    assert_equal 3, @list.get_at(2)
    assert_equal 4, @list.get_at(3)
  end

  def test_add
    @list.add('new')
    assert_equal 'new', @list.get_at(5)
  end
end


