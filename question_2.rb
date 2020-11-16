require 'minitest/autorun'

# This function is the question solution
# Args: n -> Int > 0
# ex: classificate_number(12)
def classificate_number(n)
  if n % 3 == 0 && n % 5 == 0
    return 'esoterico'
  end

  if prime?(n)
    return 'cetico,primo'
  end

  return 'cetico'
end

def prime?(n)
  if n <= 1
    return false
  end

  if n <= 3
    return true
  end

  if n % 2 == 0 || n % 3 == 0
    return false
  end

  check = 5

  while (check ** 2) <= n
    if n % check == 0 || n % (check + 2) == 0 
      return false
    end

    check += 6
  end

  return true
end

class ClassificateNumberTest < Minitest::Test
  def test_esoterico
    assert_equal 'esoterico', classificate_number(15)
  end

  def test_cetico
    assert_equal 'cetico', classificate_number(6)
  end

  def test_primo
    assert_equal 'cetico,primo', classificate_number(11)
  end
end
