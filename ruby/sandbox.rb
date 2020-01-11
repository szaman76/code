def return_number(a)
    ((a / 2)**2) * (65 - (a / 2))
end


def child_retire_money(my_age)
    child_age = my_age / 2
    child_bank = child_age * child_age
    child_retire = 65 - child_age

    child_money = child_bank * child_retire

    child_money
end

p child_retire_money(30)
p child_retire_money(50)

# Calculate how much money they'll have by multiplying by the number of years they have left until retirement.
# Estimate your child's current bank account by squaring their age.
# Estimate your child's age by dividing your age by two.
# Calculate how many years your child has left until they retire at age 65