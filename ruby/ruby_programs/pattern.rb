def pat(n)
  for i in n.downto(1)
    for j in 1..i
      print " "
    end
    for k in 1..i
      print "* "
    end
    puts
  end
end

pat(5)
