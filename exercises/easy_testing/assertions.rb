# Boolean Assertion
def test_odd?(n)
  assert_equal(true, value.odd?)
end

# Equality Assertion
def test_downcase(value)
  assert_equal('xyz', value.downcase)
end

# Nil Assertion
def test_value(value)
  assert_equal(nil, value)
end

# Empty Object Assertion
def test_empty_object(list)
  assert_equal(true, list.empty?)
end

# Included Object Assertion
def test_include(object)
  assert_equal(true, list.include?('xyz'))
end

# Exception Assertion
def test_no_experience(employee)
  assert_raise(NoExperienceError) { employee.hire }
end

# Type Assertion
def test_type(value)
  assert_instance_of(Numeric, value)
end

# Kind Asssertion
def test_kind(value)
  assert_kind_of(Numeric, value)
end

# Same Object Assertion
def test_same
  assert_same(list, list.process)
end

# Refute
def test_refute
  refute_includes(list, 'xyz')
end