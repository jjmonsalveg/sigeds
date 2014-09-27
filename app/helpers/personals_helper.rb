module PersonalsHelper
  def format_cedula(cedula)
    count = 0
    cad = String.new
    cedula.reverse.scan(/./) do |x|
      if(x =~ /\d/)
        count += 1
        if (count-1) % 3 == 0 && count != 1
          cad<< '.'
        end
        cad<< x
      else
        cad << x
      end
    end
    cad.reverse
  end
end
