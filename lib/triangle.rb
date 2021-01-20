class Triangle

  attr_accessor :sidea, :sideb, :sidec

  def initialize(sidea, sideb, sidec)
    @sidea = sidea
    @sideb = sideb
    @sidec = sidec
  end

  def kind
    validate_triangle
    if sidea == sideb && sideb == sidec
      :equilateral
    elsif sidea == sideb || sideb == sidec || sidec == sidea
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    valid_triangles = [(sidea + sideb > sidec), (sidea + sidec >sideb), (sideb + sidec > sidea)]
    [sidea, sideb, sidec].each do |side|
      valid_triangles << false unless side >0 
      raise TriangleError if valid_triangles.include?(false)
    end
  end



  class TriangleError < StandardError
  def message
    puts "no triangle"
  end

end
end