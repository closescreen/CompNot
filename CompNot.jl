module CompNot

export comp
"""
    Functional composition.
    f = comp(s->"-\$s-", s->"+\$s+", s->"=\$s=", (s1,s2)->"*\$s1/\$s2*")
    f("a","b") # "-+=*a/b*=+-"
"""
comp(f1::Function, f2::Function) = (x...)->f1(f2(x...))
comp(f1::Function, f2::Function, f3::Function, ff::Function...) = 
    comp( comp(f1,f2), f3, ff...)

export not
"""
    Functional composition with negation.
    not(f::Function) = comp(x::Bool->!x, f)
    
    f1 = x->x>2
    f1(2) # false
    f1(3) # true
    f2 = not(f1)
    f2(2) # true
    f2(3) # false
"""
not(f::Function) = comp(!, f)




end # module