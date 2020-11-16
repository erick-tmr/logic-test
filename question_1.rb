require 'date'
require 'minitest/autorun'

# This function is the question solution
# Args: birth_date -> Date
# ex: room_selector(Date.new(2020,11,23))
def room_selector(birth_date)
  today = Date.today

  age = person_age(birth_date, today)

  room_1_days_cap = 25*365 + 2*30 + 15
  room_2_days_cap = 45*365 + 1*30
  room_3_days_cap = 65*365
  age_in_days = age[:years]*365 + age[:months]*30 + age[:days]

  if age_in_days <= room_1_days_cap
    return 1

  elsif age_in_days > room_1_days_cap && age_in_days <= room_2_days_cap
    return 2

  elsif age_in_days > room_2_days_cap && age_in_days <= room_3_days_cap
    return 3
  end

  return 4
end

def person_age(birth_date, cutoff)
  cutoff_day = cutoff.day
  cutoff_month = cutoff.month
  cutoff_year = cutoff.year
  birth_day = birth_date.day
  birth_month = birth_date.month
  birth_year = birth_date.year

  days_of_month = [31, feb_days(cutoff.year), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  if birth_day > cutoff_day
    cutoff_month -= 1
    cutoff_day += days_of_month[birth_month - 1]
  end

  if birth_month > cutoff_month
    cutoff_year -= 1
    cutoff_month += 12
  end

  return {
    days: cutoff_day - birth_day,
    months: cutoff_month - birth_month,
    years: cutoff_year - birth_year
  }
end

def feb_days(year)
  if Date.leap?(year)
    return 29
  end

  return 28
end

class RoomSelectorTest < Minitest::Test
  def test_room_1
    birthday = Date.new(1996,3,1)

    assert_equal room_selector(birthday), 1
  end

  def test_room_2
    birthday = Date.new(1993,3,1)

    assert_equal room_selector(birthday), 2
  end

  def test_room_3
    birthday = Date.new(1974,3,1)

    assert_equal room_selector(birthday), 3
  end

  def test_room_4
    birthday = Date.new(1953,3,1)

    assert_equal room_selector(birthday), 4
  end
end
